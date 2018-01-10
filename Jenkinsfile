javaBuildReleaseDeploy {
    appName = 'developer-site'
    slackChannel = '#web-dev'
    buildEnvExtra = ['BUNDLE_PATH=vendor/bundle']
    def rbenvPrefix = 'source ~/.rbenvrc &&'
    buildCommand = "${rbenvPrefix} rbenv install -s && rbenv shell \$(cat .ruby-version) && ruby -v && ([[ \$(gem which bundler) ]] || gem install bundler && rbenv rehash) && bundle config build.nokogiri --use-system-libraries && bundle install --path=_buildtmp/bundle && bundle clean && bundle exec rake build"
    releaseCommand = "${rbenvPrefix} rbenv install -s && rbenv shell \$(cat .ruby-version) && ruby -v && ([[ \$(gem which bundler) ]] || gem install bundler && rbenv rehash) && bundle config build.nokogiri --use-system-libraries && bundle install --path=_buildtmp/bundle && bundle clean && bundle exec rake build"
    deployTestCommand = "b deploy test"
    deployQaCommand  = "b deploy qa"
    deployProdCommand  = "b deploy production --skip-notification"
}
