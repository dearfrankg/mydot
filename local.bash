
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

    if [ "$DEBUG" == "1" ]; then
        echo "loading local bash settings"
    fi



##-------------------------
## VARS TO MAKE THINGS EASIER
##-------------------------

    MY_LIB=$HOME/dev/lib
    MY_CODE=$HOME/dev/code
    exp=$MY_CODE/experiments
    proj=$MY_CODE/projects
    review=$MY_CODE/review


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
        rvm use 1.9.3 2>&1 > /dev/null


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
        # fg_versions    # function call

    fi

##-------------------------
## PATH
##-------------------------

    export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin"
    export PATH="$HOME/dev/bin:$PATH"

##-------------------------
## APP CONFIG
##-------------------------

    ##---------------------------------------------------
    ## HOMEBREW
    ##---------------------------------------------------
    ##
    # Needs /usr/local/bin in the PATH
    # TODO add a test to warn if not correct

    ##---------------------------------------------------
    ## notes - an app to view my markup docs
    ## hosted locally only
    ##---------------------------------------------------


        # setup env var
        export pages="$proj/Sites/notes/pages"

        # open folder and site
        alias notes=" promptweb http://notes.dev no; cd $pages; tree "
        alias pages=" cd $pages; tree "

        # function to edit doc using a partial name
        nedit() {
            file=`find $pages -type f | grep $1 | head -1 `
            if [[ -f "$file" ]]; then
                vi $file
            else
                cmd="use Frank::Nedit qw(:all); create_contentious_note();"
                vi $( perl -e "$cmd" $1 )
            fi
        }


##-------------------------
## PROJECTS
##-------------------------

    ##---------------------------------------------------
    ## Setup all projects represented in the pow directories
    ## ~/.pow and ~/.pow/apps
    ## an alias is created that will open the dir and the web page
    ##---------------------------------------------------
        setup_projects() {
            for f in ~/.pow/* ~/.pow/apps/*
            do
                [ -L $f ] || continue   # skip unless symlink
                local name=${f##*/}
                local path=$(readlink $f)
                unalias $name > /dev/null 2>&1
                alias $name="promptweb http://$name.dev no; cd $path && ll"
            done
        }
        setup_projects

        start_apps() {
            for f in ~/.pow/apps/*
            do
                [ -L $f ] || continue   # skip unless symlink
                local name=${f##*/}
                local path=$(readlink $f)
                local server="$path/$name-server"
                echo "starting $server ..."
            done
            
        }


##-------------------------
## HOST SHORTCUTS
##-------------------------

    ##---------------------------------------------------
    ## dearfrankg.com aka marylinfashion.com
    ## hosted at amazon web services EC2
    ##---------------------------------------------------
        # ssh $awsroot -- login as root
        awsroot=" -i /Users/frankg/.ssh/web-server-key.pem ubuntu@184.169.146.13"

        # ssh $aws -- login as frankg
        aws="frankg@dearfrankg.com"


##-------------------------
## SHORTCUTS
##-------------------------



    ##-------------------------
    ## KEY ENV VARS
    ##-------------------------

    export mongohq_api_key="rl5mbioglwzc5xk04cm5"
    export mongolab_api_key="503f0450e4b04102cdfdc589"


    ##-------------------------
    ## KEY DIRECTORIES
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


    ##-------------------------
    ## SHORTCUTS
    ##-------------------------
    alias         pd="perldoc"
    alias         pf="plackfile "
    alias         sl="sqlite3 "
    alias  img-optim="open -a ImageOptim $@"

    alias      vocab='vi "/Users/frankg/Documents/3GB PERSONAL DATA/pdev/vocab/vocab.md" '
    alias   get_enyo=" cp -r $MY_LIB/js/bootplate/enyo . "
    alias      sysls='sudo launchctl list | grep -v "apple" | grep -v "chrome" | sort'
    alias        ngx='sudo vi /usr/local/etc/nginx/nginx.conf'



#----------------------------------
# END OF FILE
#----------------------------------
