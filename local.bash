##--------------------------------------------------
##
## LOCAL BASH SETTINGS
##
##--------------------------------------------------

    [[ "$DEBUG" == "1" ]] && echo "loading local bash settings"


##-------------------------
## SETUP PATH
##-------------------------

    export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin"
    export PATH="$HOME/dev/bin:$PATH"


##-------------------------
## VARS TO MAKE THINGS EASIER
##-------------------------

    MY_LIB=$HOME/dev/lib
    MY_CODE=$HOME/dev/code
    exp=$MY_CODE/experiments
    proj=$MY_CODE/projects
    review=$MY_CODE/review


##-------------------------
## ALIASES
##-------------------------

    alias          pow="showdir ~/.pow"
    alias          met="meteor $@"
    alias           hm='showdir ~ '
    alias          dev="showdir $MY_CODE/.."
    alias         code="showdir $MY_CODE"
    alias          exp="showdir $exp"
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
## LOAD LOCAL PLUGINS
##-------------------------

    load_plugins "$MYBASH/plugins/*.local.bash"



#----------------------------------
# END OF FILE
#----------------------------------
