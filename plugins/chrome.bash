

#----------------------------------------------------------------------------
# Google Chrome See Passwords
#----------------------------------------------------------------------------

    # chrome://settings/passwords

#----------------------------------------------------------------------------
# Google Chrome Bookmarks
#----------------------------------------------------------------------------

    # cp "/Users/frankg/Library/Application Support/Google/Chrome/Default/Bookmarks.bak" ~/Desktop

#----------------------------------------------------------------------------
# Google Chrome Fixes
#----------------------------------------------------------------------------

  # Horizontal Rubberbanding
    # Prefs -> Trackpad -> More gestures
    #   - disable `swipe between pages`


  # Vertical Rubberbanding - that bounce at the bottom of the web page
  alias rb-disable='defaults write -g NSScrollViewRubberbanding -bool false'
  alias rb-enable='defaults delete -g NSScrollViewRubberbanding'


