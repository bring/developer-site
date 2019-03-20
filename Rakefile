
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
  puts '= install RAML parse dependencies'
  system('npm install')
  puts '= install css dependencies'
  system('cd _sass && npm install')
end

desc 'Build the _site directory'
task :build, [:environment] => [:clean, :install_dependencies] do |t, args|
  args.with_defaults(:environment => "test")
  configurationFile = "_config.yml"
  if args.environment == 'production'
      configurationFile = "_config_production.yml"
  end
  puts "= build using jekyll with env #{args.environment}. Using configuration file #{configurationFile}"
  system("JEKYLL_ENV=#{args.environment} bundle exec jekyll build --trace --config #{configurationFile}")
  system('git rev-parse HEAD >> _site/.gitcommit')
end

desc 'Run locally using jekyll'
task :serve, [:environment] => [:clean, :install_dependencies] do |t, args|
  args.with_defaults(:environment => "test")
  system('cd _sass && npm install')
  configurationFile = "_config.yml"
  if args.environment == 'production'
      configurationFile = "_config_production.yml"
  end
  puts "= serve using jekyll with env #{args.environment}. Using configuration file #{configurationFile}"
  system("JEKYLL_ENV=#{args.environment} bundle exec jekyll serve --trace --incremental --config #{configurationFile}")
end
