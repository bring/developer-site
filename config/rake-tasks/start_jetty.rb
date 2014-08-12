require 'bring/tasks'

#
# User Developer site Environment extensions
#
class DeveloperSiteTasks < Bring::Tasks

  # override
  Bring::Tasks.register(self) do

    # Local development and deployment stuff
    namespace :dev do
      @environment = 'dev'

      desc "Start jetty locally."
      task :server do
        local_jetty_init()
      end

    end
  end

  def local_jetty_init()
    maven_opts = "-Xdebug -Xrunjdwp:transport=dt_socket,address=8009,server=y,suspend=n -XX:MaxPermSize=356m -Xmx512m"
    jrebel_jar = "#{ENV['JREBEL_HOME']}/jrebel.jar"
    puts "jrebel var is #{jrebel_jar}"
    if File.exist?(jrebel_jar)
      maven_opts = "#{maven_opts} -noverify -javaagent:#{jrebel_jar} -Drebel.velocity_plugin=true -Drebel.log4j-plugin=true -Drebel.jackson_plugin=true -XX:+UseParallelGC -XX:+CMSClassUnloadingEnabled"
    end
    ENV['MAVEN_OPTS'] = maven_opts
    exec("mvn jetty:run -f developer-site-web/pom.xml -o -DCONSTRETTO_TAGS=dev")
  end
end

