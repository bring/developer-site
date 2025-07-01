---
layout: post
title: Our journey through java9 module hell… and then to java10
publishDate: 2018-04-24 09:09:43 +01:00
tags:
  - migration
params:
  authors:
    - achintsatsangi
---

We run many micro-services based on java, j2ee technologies and usually try to keep up with all the updates coming in on a day to day basis in the technologies so when java9 was announced we thought that "Hmmm… that’s new". It was the first java release that wasn't backward compatible, came with a declaration that it will surely break all our environments and would need time and effort to solve it. We took it as a challenge and thought that we will sail through it easy, but trust me we were wrong.

Background
---

Java9 was release on 21 September 2017, and we were already delayed by half a year to start moving our applications to use it. It was kind off surprising as we have always been moving along with the updates and have always used the latest JVM. We were about to know why.

Java9 comes with a modular approach which allows reducing the JVM size and ability to specify what you need instead of providing all that people usually need. This change would help making the JVM smaller in size as each application can pick what they need instead of the whole lot and in the world of Docker, cloud it makes a lot of sense it will reduce the JVM size to as small as 30-40 MB only.

So that was the good part, the bad part of the same approach is it adds complexities to the migration process to java9 as you have to specify each and every module you require during compile time, test execution, automation tests, build environment, run time or any other way of running your application.

This was our third attempt at trying to migrate our application to java9 as in the previous attempts we faced roadblocks along the way like ratpack libs not supporting java9 and others. So we started after watching a very nice presentation `To JAR Hell And Back - A Live Migration to the Java 9 Module System - Nicolai Parlog` where he discussed how they were able to migrated a java based web application (mostly REST services) to java9

[![To JAR Hell And Back - A Live Migration to the Java 9 Module System - Nicolai Parlog](To-jar-hell-and-back.jpg)](https://vimeo.com/233801793)

The approach suggested in the presentation is as follows:

1. Make separate profile for java9 so that application can still be built over java8
2. Add `--add-modules`, `--patch-modules` as per need to your maven compiler command arguments to solve any ClassNotFoundException's, NoClassDefinitionFoundException's. (Sounds easy, but these are the toughest nut to crack, which module or jar is needed to get access to the particular class... Maybe naming the methods and classes is still the toughest part.... so lets place it at second) 
3. Add the same to run your application with `java -jar` command and viola the application is migrated.

To ensure we don't end up in trouble during migration, as a preparation we upgraded all our dependcies up to the highest version possible hoping that the latest versions will be more compatible with java9 and will reduce our troubles. We were pretty confident about the approach and started with one of the smallest applications to avoid any unforeseen problems. After putting conscious efforts for 3 days, we were able to successfully build our application, execute tests and run it locally with java9. It required the following:   

- Since we use jetty, it had to be upgraded to version `9.4.9.v20180320` as versions below `9.4.6`don't support java9.
- A new java9 profile activated by usage of jdk9, which looked something like this

```xml
<profile>
<id>java-9</id>
<activation>
    <jdk>9</jdk>
</activation>
<properties>
    <maven.compiler.source>9</maven.compiler.source>
    <maven.compiler.target>9</maven.compiler.target>
</properties>
<build>
    <plugins>
        <plugin>
            <artifactId>maven-compiler-plugin</artifactId>
            <version>3.5.1</version>
            <configuration>
                <compilerArgs>
                    <arg>--add-modules java.xml.bind</arg>
                    <arg>--add-modules java.xml.ws</arg>
                </compilerArgs>
            </configuration>
        </plugin>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-surefire-plugin</artifactId>
            <version>${surefireplugin.version}</version>
            <configuration>
                <argLine>
                    --add-modules java.xml.bind, java.xml.ws
                </argLine>
            </configuration>
        </plugin>
    </plugins>
</build>
</profile>
```

- Had to add dependencies to `jaxb2-maven-plugin` to make it work and generate pojos:

```xml
<dependency>
    <groupId>javax.activation</groupId>
    <artifactId>javax.activation-api</artifactId>
    <version>1.2.0</version>
</dependency>
```

- The application startup maven command also had to be tweaked to pass the modules at runtime to 

```
MAVEN_OPTS='--add-modules java.xml.bind, java.xml.ws' mvn jetty:run
```

This change also required us to change the way our build and deployment scripts are written so that we could have configurable modules to be patched, added and exported for the application to function properly. While we were trying to workout how to best solve the same one of the developers in the team shared an update from `Oracle` stating that java9 modules will not be supported from java 11 which would be released in September this year. This was a surprise as we had already migrated to use modules and make our apps compatible with java9. As java 11 is to be released within the next 6 months there was no point trying to make changes that will not be compatible with it and hence we decided to change our approach.

The new approach was.... use maven dependencies to import all required dependencies including java EE ones and try to make things work regardless of which version of java is used. Eureka, this turned out to be the best possible change in approach, our poms looked much cleaner, there was no need to make changes to our startup, build and deployment scripts. The changes we ended up making were :

- Jetty version upgrade to `9.4.9`
- Added dependencies to application POM:

```xml
<dependency>
    <groupId>javax.xml.bind</groupId>
    <artifactId>jaxb-api</artifactId>
    <version>${jaxb-version}</version>
</dependency>
<dependency>
    <groupId>com.sun.xml.bind</groupId>
    <artifactId>jaxb-core</artifactId>
    <version>${jaxb-version}</version>
</dependency>
<dependency>
    <groupId>com.sun.xml.bind</groupId>
    <artifactId>jaxb-impl</artifactId>
    <version>${jaxb-version}</version>
</dependency>
<dependency>
    <groupId>javax.xml.ws</groupId>
    <artifactId>jaxws-api</artifactId>
    <version>2.3.0</version>
</dependency>
<dependency>
    <groupId>com.sun.xml.messaging.saaj</groupId>
    <artifactId>saaj-impl</artifactId>
    <version>1.4.0</version>
</dependency>
<dependency>
    <groupId>jstl</groupId>
    <artifactId>jstl</artifactId>
    <version>1.2</version>
</dependency>
```
   
PS : JSTL libs are required at run time and not compile time for JSP rendering

- Had to add dependencies to `jaxb2-maven-plugin` to make it work and generate pojos as earlier

Since everything is in maven dependencies itself, there is no need to make separate profiles for different java versions. This approach made it possible to keep all our changes local with in the application and keep our build and deployment scripts as is.

The following section covers the changes required in our continuous build server (jenkins) and puppet configurations to make the application build and run with java9.

Installing java9 on our servers with puppet
---
As openJdk version of java9 isn't available right now, we had to download the installer with `wget` and install it with command line. The configuration looks like below:

```
exec { "Download JDK 9":
    command     => "wget --header 'Cookie: oraclelicense=something' 'http://download.oracle.com/otn-pub/java/jdk/9.0.4+11/c2514751926b4512b076cc82f959763f/jdk-9.0.4_linux-x64_bin.rpm';",
    creates     => '/opt/jdk-9.0.4_linux-x64_bin.rpm',
    cwd         => '/opt',
  }

  exec { "Install JDK 9":
    command   => 'rpm -ivh /opt/jdk-9.0.4_linux-x64_bin.rpm',
    creates   => '/usr/java/jdk-9.0.4',
    require   => Exec['Download JDK 9'],
  }
```
    
After running above puppet configuration on all servers we have our java9 jdk installed and available and applications can be moved to use that environment. On the build server we had to manually configure java9 as a build environment using the global configuration. 
Since we used jdk8 as default jdk for building our applications we had to make it configurable and override the same with java9 for particular applications.. following code snippet shows how the same was achieved:

```
if (config.jdkOverride != '') {
    jvmHome = tool config.jdkOverride
} else {
    jvmHome = tool 'OpenJDK 8'
}
```
 
With above configurations in place, we updated our TEST, QA and PRODUCTION instances one-by-one and were able to migrate our first application to java9 successfully. And then came the major setback..... we completed our migration to java9 on 17 April and java10 was release on 20 March of the same year hence we were a version behind already.  

Migration to Java 10
---
There was a bet inplace amongst two of the other teams on who would be able to migrate there application to java10 before the other. Even though we were not part of those teams and were not in the race, we were already a few steps ahead of others as we were already on java9 while others were using java8. So we decided to take part and do the whole thing over a conference video call with all the team members taking part.

The puppet and build config were given to one guy to install java10 on our servers and make it available for configurations at runtime. Another guy was given charge of making changes to the application and adding libraries required to make the application compatible with java10. In the end we sailed through this migration with ease. The major change made was in the application itself to add libraries required for missing classes. they were : 

```xml
<dependencies>
    <dependency>
        <groupId>org.ow2.asm</groupId>
        <artifactId>asm</artifactId>
        <version>6.1.1</version>
    </dependency>
    <dependency>
        <groupId>org.ow2.asm</groupId>
        <artifactId>asm-commons</artifactId>
        <version>6.1.1</version>
    </dependency>
    <dependency>
        <groupId>org.ow2.asm</groupId>
        <artifactId>asm-tree</artifactId>
        <version>6.1.1</version>
    </dependency>
</dependencies>
```

Right now the application is running with java10 in TEST and QA and would be moved to java10 in production by end of day today

Learning summary
---

- Do not use java9 modules as they will be removed in java11
- Maven dependencies are your friend, use them wisely and be economic on what you really need
- use `jenv` for switching java versions, it is fairly simple and easy to install and use `http://www.jenv.be/`
