# Automatically generated file. DO NOT EDIT!
# Edit skeleton.rakefile.rb in deploy-scripts and run 'rake setup:update' to update this file

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/deploy-scripts/lib')

require 'rubygems'
require 'bundler'
require 'rake'
Bundler.setup
require 'thor'
require 'nokogiri'
require 'net/https'
require 'net/ssh'
require 'net/scp'
require 'open-uri'

unless File.exists?('deploy-scripts/.git')
  # Clone deploy-scripts if not available
  system('git submodule init deploy-scripts')
  system('git submodule update deploy-scripts')
end

gitstatus = ''
IO.popen('git submodule status deploy-scripts') do |f|
  gitstatus += f.read
end

if gitstatus =~ /^\+/
  puts "!!! Your deploy-scripts is not up-to-date, run 'git submodule update' to update !!!"
  puts "\n"
end

Dir["./config/rake-tasks/*.rb"].each {|file| require file }
Dir["./deploy-scripts/lib/bring/tasks/*.rb"].each {|file| require file }

Bring::Tasks.init

class VerificationError < StandardError; end
