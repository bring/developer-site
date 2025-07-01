---
layout: post
title: Configuring jenv the right way
publishDate: 2018-07-27 11:13:43 +01:00
tags:
  - command line tool
params:
  authors:
    - sujithsreekumar
---

Since many of our applications are continuously being upgraded to latest java versions, most of us may have already installed `jenv` command line tool. But, does it really work the way it should for you? Or, are you struggling to understand or configure it the right way?

Background
---

`jenv` is a cool tool that helps you switch between different java versions in your development machine. But unfortunately, the documentation in `http://www.jenv.be/` is not proper to help you with the setup. There's something more you need to do to make it work properly. This blog is for the newbies who are trying out `jenv` for the first time or for those who still couldn't get it working properly.

You could try following the steps mentioned in [jenv website](http://www.jenv.be/), but I bet, you won't get it working, right away!

Setup
---

Okay, lets get startled ;) !!!!  

* Install jenv. I preferred to use Homebrew...  `$ brew install jenv`

* Run the following commands :
```
  $ echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bash_profile
```
```
  $ echo 'eval "$(jenv init -)"' >> ~/.bash_profile
```

* Now, before you do anything else, you must run `unset JAVA_TOOL_OPTIONS` on your terminal (in case you have output that breaks the text parsing). Without this the command following below will not work as expected.

* Check you jdk installation directories.. and then run the below commands as appropriate for you..
```
$ jenv add /Library/Java/JavaVirtualMachines/jdk-10.0.1.jdk/Contents/Home
```
   You can add multiple jdks if you want.
  
* Type `jenv versions` on terminal. You would see something similar to this..

```
  system (set by /Users/sujithsreekumar/.jenv/version)
  - 1.8
  - 1.8.0.92
  - 10.0
  - 10.0.1
  - 9.0
  - 9.0.1
  - oracle64-1.8.0.92
  - oracle64-10.0.1
  - oracle64-9.0.1
```

  You could remove the ones like `oracle64-1.8.0.92`, `oracle64-10.0.1` etc. that got added by itself, by using the command `jenv remove oracle64-1.8.0.92`. But that's completely optional... You could leave them there if you want. No harm.

  Are we done? **_Not yet!!!_**

There are a couple of things more that you need to do to get it working properly...

* Run the following commands if you are using maven :
```
  $ jenv enable-plugin maven
```
```
  $ jenv enable-plugin export
```

_**PS :**_ If you get errors stating that the command enable-plugin is not found, you must restart your terminal and things should work properly thereafter.

I had to run `jenv enable-plugin export` because my `jenv` was not able to control my `JAVA_HOME`. Also failing to run `jenv enable-plugin maven` will throw weird errors when trying to compile your project.


Now.. You are all set...

Verify 
---

You mostly only will need to use `jenv local` to set the java version for your project. You may `cd` to your project directory and type 
```
  $ jenv local 10.0
```

With this command, a `.java-version` file gets auto created in your project directory. You may opt to add this file in `.git-ignore` list (if you want).

Now, if you type 
```
  $ echo $JAVA_HOME
```
OR
```
  $ javac -version
```
You should be seeing the currently set version (which should be java `10.0` or `10.0.1` as per the above example) as you java version. If not, something's not right, and you may not get the intended behaviour out of your `jenv`.


Hope this helps... Happy Coding!
