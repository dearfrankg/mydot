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


    alias         pd="perldoc"
    alias         pf="plackfile "
    alias         sl="sqlite3 "
    alias  img-optim="open -a ImageOptim $@"

    alias      vocab='vi "/Users/frankg/Documents/3GB PERSONAL DATA/pdev/vocab/vocab.md" '
    alias   get_enyo=" cp -r $MY_LIB/js/bootplate/enyo . "
    alias      sysls='sudo launchctl list | grep -v "apple" | grep -v "chrome" | sort'
    alias        ngx='sudo vi /usr/local/etc/nginx/nginx.conf'


##-------------------------
## LOAD PLUGINS
##-------------------------

source $PB      # load the plugins




#----------------------------------
# END OF FILE
#----------------------------------
