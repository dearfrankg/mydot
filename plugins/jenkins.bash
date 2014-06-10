
# Jenkins CI
# -------------------------------


# Installing jenkins

#   Dependencies:

#   - jenkins depends on java (install oracle jdk7 which cleans up apple jdk6 bs)

#   Installing

#   - download installer package (http://jenkins-ci.org/)

#   NOTE:

#   - did a fresh install: jan6 2014 
#   - version 1.546



jenkins_start() {
  sudo launchctl load /Library/LaunchDaemons/org.jenkins-ci.plist
  echo 'sudo launchctl list | grep jenkin'
  sudo launchctl list | grep jenkins
}


jenkins_stop() {
  sudo launchctl unload /Library/LaunchDaemons/org.jenkins-ci.plist
  echo 'sudo launchctl list | grep jenkin'
  sudo launchctl list | grep jenkins
}


