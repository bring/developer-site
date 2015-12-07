require 'json'
require 'raml_parser'

task :default do
  system('rake -T')
end

desc 'Delete Jekyll build directory (_site/)'
task :clean do
  puts '= delete _site directory'
  system('rm -R _site/ 2>/dev/null')
end

desc 'Install css dependencies using npm'
task :install_css do
  puts '= install css dependencies using npm'
  system('cd _sass && npm install')
end

desc 'Build the _site directory'
task :build => [:clean, :install_css] do
  puts '= build using jekyll'
  system('bundle exec jekyll build --trace')
end

namespace :dev do
  desc 'Run locally using jekyll'
  task :server => [:clean, :install_css] do
    puts '= serve using jekyll'
    system('cd _sass && npm install')
    system('bundle exec jekyll serve --trace')
  end
end


namespace :test do
  desc 'Deploy to test'
  task :deploy => :build do
    deploy_to_server('mybring1test.bd.bring.no')
    puts '= done! http://developer.test.bring.com/'
  end
end

namespace :qa do
  desc 'Deploy to QA'
  task :deploy => :build  do
    deploy_to_server('mybring7qa.bd.bring.no')
    deploy_to_server('mybring8qa.bd.bring.no')
    puts '= done! http://developer.qa.bring.com/'
  end
end

namespace :production do
  desc 'Deploy to production'
  task :deploy => :build do
    deploy_to_server('mybring7prod.bd.bring.no')
    deploy_to_server('mybring8prod.bd.bring.no')
    notify_slack('New version of http://developer.bring.com/ deployed')
    puts '= done! http://developer.bring.com/'
  end
end

def notify_slack(message)
  # channel and icon configured here:
  # https://posten.slack.com/services/10724202165
  url = 'https://hooks.slack.com/services/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'
  proxy = 'http://sig-web.posten.no:3128'
  slack_notification = {
    :text => message
  }
  puts '= notify slack'

  system("curl -x '#{proxy}' --silent -X POST \
    --data-urlencode 'payload=#{slack_notification.to_json.to_s}' \
    #{url} 1>/dev/null")
end

def deploy_to_server(server)
  puts "= deploy to #{server}"
  unless system("rsync -hrvz _site/ bring@#{server}:/var/www/developer-site")
    raise "Issues while uploading site changes to bring@#{server}:/var/www/developer-site"
  end
end
