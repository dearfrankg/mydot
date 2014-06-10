
#----------------------------------------------------------------------------
#   OSX
#----------------------------------------------------------------------------




  #----------------------------------------------------------------------------
  # OSX TIPS
  #----------------------------------------------------------------------------

    # Show/Hide desktop icons
    alias showDesktopIcons='defaults write com.apple.finder CreateDesktop -bool true && killall Finder '
    alias hideDesktopIcons='defaults write com.apple.finder CreateDesktop -bool false && killall Finder '


    # Show/Hide folders
    alias showFolder='sudo chflags nohidden '
    alias hideFolder='sudo chflags hidden '


    # Show hidden files in save dialog boxes
    # defaults write -g AppleShowAllFiles -bool true


    # Extended Attributes -- http://superuser.com/questions/726112/macos-extended-attributes-xattr-d-not-removing-extended-attributes
    #
    # Indication of extended attributes -- the @ symbol
    # -rw-r--r--@ 1 steve  staff  1692 Mar  7 11:30 /shared/sparkeast.pem
    #
    # clear all extended attributes
    # xattr -c /shared/sparkeast.pem


    # Sound Controls Stop Working
    # sudo killall coreaudiod





#----------------------------------------------------------------------------
#   ADDITIONAL INSTALLATIONS ON TOP OF OSX
#----------------------------------------------------------------------------

  #----------------------------------------------------------------------------
  #  Install Xcode
  #----------------------------------------------------------------------------

    # install
    # xcode-select --install

    # Agree to the xcode license
    # sudo xcrun cc


  #----------------------------------------------------------------------------
  #  BREW INSTALLS
  #----------------------------------------------------------------------------
      # git
      # hub
      # nginx
      # wget
      # tree
      # ack
      # ios-sim
      # // rvm forced build tool installs





#----------------------------------------------------------------------------
# iPhone simulator
#----------------------------------------------------------------------------
# ios-sim start