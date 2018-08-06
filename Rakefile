
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
task :build, [:environment] => [:clean, :install_dependencies] do |t, args|
  args.with_defaults(:environment => "production")
  puts "= build using jekyll with env #{args.environment}"
  system("JEKYLL_ENV=#{args.environment} bundle exec jekyll build --trace")
  system('git rev-parse HEAD >> _site/.gitcommit')
end

desc 'Run locally using jekyll'
task :serve, [:environment] => [:clean, :install_dependencies] do |t, args|
  args.with_defaults(:environment => "production")
  puts "= serve using jekyll with env #{args.environment}"
  system('cd _sass && npm install')
  system("JEKYLL_ENV=#{args.environment} bundle exec jekyll serve --trace --incremental")
end
