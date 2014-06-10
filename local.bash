##--------------------------------------------------
##
## LOCAL BASH SETTINGS
##
##--------------------------------------------------

    [[ "$DEBUG" == "1" ]] && echo "loading local bash settings"


##-------------------------
## SETUP PATH
##-------------------------

    # NOTE: brew requires /usr/local/bin before /usr/bin

    export PATH="/usr/local/bin:$PATH:/usr/local/sbin:/usr/X11/bin:$HOME/dev/bin"


##-------------------------
## VARS TO MAKE THINGS EASIER
##-------------------------

    MY_LIB=$HOME/dev/lib
    MY_CODE=$HOME/dev/code
    proj=$MY_CODE
    review=$MY_CODE/review


##-------------------------
## ALIASES
##-------------------------

    alias          pow="showdir ~/.pow"
    alias          met="meteor $@"
    alias           hm='showdir ~ '
    alias          dev="showdir $MY_CODE/.."
    alias         code="showdir $MY_CODE"
    alias         proj="showdir $proj"
    alias       review="showdir $review"
    alias       skills="showdir $MY_CODE/skills"
    alias    downloads='showdir ~/Downloads '



##-------------------------
## LOAD PLUGINS
##-------------------------

source $PB      # load the plugins




#----------------------------------
# END OF FILE
#----------------------------------
