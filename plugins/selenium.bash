
# Selenium


# UPDATE: jan6

#   - selenium stand-alone server comes with protractor npmpackage




## BREW OUTPUT

# To have launchd start selenium-server-standalone at login:

#       ln -sfv /usr/local/opt/selenium-server-standalone/*.plist ~/Library/LaunchAgents

# Then to load selenium-server-standalone now:

#       launchctl load ~/Library/LaunchAgents/homebrew.mxcl.selenium-server-standalone.plist

# Or, if you don't want/need launchctl, you can just run:

#       java -jar /usr/local/opt/selenium-server-standalone/selenium-server-standalone-2.37.0.jar -p 4444


## Selenium Server Standalone 

function selenium_help () { 
cat <<"END"
  sel_help    selenium help
  sel_start   start selenium
  sel_quit    quit selenium
END
}


alias sel_help='selenium_help'
alias sel_start='sudo launchctl load  ~/Library/LaunchAgents/homebrew.mxcl.selenium-server-standalone.plist '
alias sel_quit='sudo launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.selenium-server-standalone.plist
'



