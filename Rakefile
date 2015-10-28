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

namespace :preview do
  desc 'Deploy preview site to QA under demo-on-demand blog'
  task :deploy do
    unless system('bundle exec jekyll build --config _preview.config.yml --destination _preview.site')
      raise "Could not build preview"
    end
    deploy_preview_site_to_server('posap402.bd.bring.no')
    deploy_preview_site_to_server('posap403.bd.bring.no')
    puts '= done! http://internal.qa.bring.com/demo-on-demand/developer-site/'
  end
end

def deploy_preview_site_to_server(server)
  puts "= deploy to #{server}"
  unless system("rsync -hrvz _preview.site/ bring@#{server}:/var/www/demo-on-demand/demo-on-demand/developer-site/")
    raise "Issues while uploading site changes to bring@#{server}:/var/www/demo-on-demand/demo-on-demand"
  end
end
