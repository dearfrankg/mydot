
##--------------------------------------------------
##
##
##
## LOCAL BASH SETTINGS
##
##
##
##--------------------------------------------------

##-------------------------
## GET LOCAL FUNCTIONS
##-------------------------

    source "/Users/frankg/.bash_custom/local_functions.bash"

    if [ "$DEBUG" == "1" ]; then
        echo "loading local bash settings"
    fi

##-------------------------
## PATH
##-------------------------

    export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin"
    export PATH=$PATH:~/dev/bin


##-------------------------
## VARS TO MAKE THINGS EASIER
##-------------------------

    MY_DEV=~/dev
    MY_LIB=~/dev/lib
    MY_CODE=~/dev/code
    exp=$MY_CODE/code-experiments
    review=$MY_CODE/code-review


##-------------------------
## APP REQUIREMENTS
##-------------------------

    ##
    ## LANGUAGE SETUP
    ##
    if [ "$USER" = "frankg" ]; then



        ##
        ## PERL + PERLBREW
        ##
        # perlbrew
        export PERLBREW_ROOT=$MY_LIB/perl5
        source $PERLBREW_ROOT/etc/bashrc

        #cpanm defaults
        export PERL_CPANM_OPT="-nq"

        # cpanm auto-completion
        source setup-bash-complete


        ##
        ## RUBY + RVM
        ##
        [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
        rvm use 1.9.2 2>&1 > /dev/null


        ##
        ## NODE + NPM
        ##
        # Node was installed at /usr/local/bin/node
        # npm was installed at /usr/local/bin/npm
        # Make sure that /usr/local/bin is in your $PATH.


        ##
        ## JAVA
        ##
        classpath="$exp/dev-skills/oo-design-patterns"
        export WORK=$classpath/FG_DP/src/frankMade
        export CLASSPATH="$classpath/HF_DP/bin:$classpath/FG_DP/bin"


        ##
        ## REPORT VERSIONS AT STARTUP
        ##
        fg_versions    # function call

    fi


##-------------------------
## APPS
##-------------------------

    ##
    ## HOMEBREW
    ##
    # Needs /usr/local/bin in the PATH
    # TODO add a test to warn if not correct


##-------------------------
## PROJECTS
##-------------------------

    ##---------------------------------------------------
    ## www.marylinfashion.com - Mary's business website
    ## hosted at amazon web services EC2
    ##---------------------------------------------------

        # login as root user
        awsroot=" -i /Users/frankg/.ssh/web-server-key.pem ubuntu@184.169.146.13"

        # login as frankg
        aws="frankg@dearfrankg.com"

        # open folder and site
        alias mfd="chrome http://mfd.dev; showdir $MY_CODE/code-projects/mfd/public ; ll"


    ##---------------------------------------------------
    ## msite - Movie Website Project
    ## hosted at amazon web services EC2
    ##---------------------------------------------------

        # open folder and site
        alias msite="chrome http://msite.dev; cd $MY_CODE/code-projects/msite/public ; ll"


    ##---------------------------------------------------
    ## notes - an app to view my markup docs
    ## hosted locally only
    ##---------------------------------------------------

        # open folder and site
        alias notes=" chrome http://notes.dev; cd $MY_CODE/apps/notes/pages ; tree "

        # function to edit doc using a partial name
        nedit() {
            file=`find $pages -type f | grep $1 | head -1 `
            [[ -f "$file" ]] && vi "$file"
        }


    ##---------------------------------------------------
    ## fboot - design gallery website
    ## hosted locally only
    ##---------------------------------------------------

        # open folder and site
        alias fboot="chrome http://fboot.dev; cd $MY_CODE/code-projects/fboot/public ; ll"










##-------------------------
## SHORTCUTS
##-------------------------

    ##-------------------------
    ## SHORTCUTS
    ##-------------------------

    alias         pd="perldoc"
    alias         sl="sqlite3 "
    alias  img-optim="open -a ImageOptim $@"

    alias      vocab='vi "/Users/frankg/Documents/3GB PERSONAL DATA/pdev/vocab/vocab.md" '
    alias   get_enyo=" cp -r $MY_LIB/js/bootplate/enyo . "
    alias      sysls='sudo launchctl list | grep -v "apple" | grep -v "chrome" | sort'
    alias        ngx='sudo vi /usr/local/etc/nginx/nginx.conf'


    ##-------------------------
    ## KEY DIRECTORIES
    ##-------------------------

    alias          dev="showdir $MY_DEV"
    alias         apps="showdir $MY_CODE/apps"
    alias         code="showdir $MY_CODE"
    alias       review="showdir $review"
    alias          exp="showdir $exp"
    alias           hm='showdir ~ '
    alias    downloads='showdir ~/Downloads '


#----------------------------------
# END OF FILE
#----------------------------------
