javaBuildReleaseDeploy {
    appName = 'developer-site'
    slackChannel = '#deploy'
    buildCommand = 'npm i && npm run buildprod'
    releaseCommand = 'npm i && npm run buildprod && git tag `date +%y%m%d-%H%M`'
    deployTestCommand = 'b deploy test'
    deployQaCommand  = 'b deploy qa'
    deployProdCommand  = 'b deploy production --skip-notification'
}
