
task :default do
  system('rake -T')
end

desc 'Delete Jekyll build directory (_site/)'
task :clean do
  puts '= delete _site directory'
  system('rm -R _site/ 2>/dev/null')
end

desc 'Install dependencies'
task :install_dependencies do
  puts '= install RAML parse dependencies using yarn'
  system('yarn install')
  puts '= install css dependencies using npm'
  system('cd _sass && npm install')
end

desc 'Build the _site directory'
task :build => [:clean, :install_dependencies] do
  puts '= build using jekyll'
  system('JEKYLL_ENV=production bundle exec jekyll build --trace')
end

desc 'Run locally using jekyll'
task :serve => [:clean, :install_dependencies] do
  puts '= serve using jekyll'
  system('cd _sass && npm install')
  system('bundle exec jekyll serve --trace --incremental')
end
