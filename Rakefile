require 'raml_parser'

task :default do
  system('rake -T')
end

desc 'Delete RAML build (api/) and Jekyll build (_site/)'
task :clean do
  puts '= delete _site directory'
  system('rm -R _site/ 2>/dev/null')
  puts '= delete api directory'
  system('rm -R api/ 2>/dev/null')
end

desc 'Build the _site directory'
task :build => [:clean] do
  puts '= build using jekyll'
  system('bundle exec jekyll build --trace')
end

namespace :dev do
  desc 'Run locally using jekyll'
  task :server => [:clean] do
    puts '= serve using jekyll'
    system('bundle exec jekyll serve --trace')
  end
end

