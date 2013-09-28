

# lineman.js helpers

alias lmbuild='lineman build'

alias lmserver='lineman run'

alias lmspec='lineman spec'

alias lmsel="pushd logs ; java -jar /usr/local/opt/selenium-server-standalone/selenium-server-standalone-2.31.0.jar \
  -p 4444 -Dwebdriver.chrome.driver=/usr/local/opt/chromedriver/bin/chromedriver ; popd "

alias lme2e="./node_modules/.bin/protractor config/spec-e2e.js "

alias lmspecci='lineman spec-ci'


