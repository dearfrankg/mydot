

jenkins_start() {
  sudo launchctl load /Library/LaunchDaemons/org.jenkins-ci.plist
}


jenkins_stop() {
  sudo launchctl unload /Library/LaunchDaemons/org.jenkins-ci.plist
}


