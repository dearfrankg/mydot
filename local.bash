
##--------------------------------------------------
##
##
##
## LOCAL BASH SETTINGS
##
##
##
##--------------------------------------------------

source "/Users/frankg/.bash_custom/local_functions.bash"

if [ "$DEBUG" == "1" ]; then
    echo "loading local bash settings"
fi

#-------------------------
## PATH
#-------------------------

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin"
export PATH=$PATH:~/dev/bin



#-------------------------
## VARS TO MAKE THINGS EASIER
#-------------------------
MY_DEV=~/dev
MY_LIB=~/dev/lib
MY_CODE=~/dev/code


#-------------------------
## APP REQUIREMENTS
#-------------------------

## HOMEBREW
# Needs /usr/local/bin in the PATH
# TODO add a test to warn if not correct

#cpanm defaults
export PERL_CPANM_OPT=" -nq "

if [ "$USER" = "frankg" ]; then

    echo "setting up perlbrew and rvm"

    ## PERL
    # perlbrew
    export PERLBREW_ROOT=$MY_LIB/perl5
    source $PERLBREW_ROOT/etc/bashrc

    ## RUBY
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

    ## NODE
    # Node was installed at /usr/local/bin/node
    # npm was installed at /usr/local/bin/npm
    # Make sure that /usr/local/bin is in your $PATH.

fi


#-------------------------
## PROJECTS
#-------------------------

## MFD
mfd="mary4515@marylinfashion.com"
alias            mfd="showdir $MY_CODE/mfd"



#-------------------------
## SHORTCUTS
#-------------------------

## system control 
alias sysls='sudo launchctl list | grep -v "apple" | grep -v "chrome" | sort'


## dir shortcuts
alias      dev="showdir $MY_DEV"
alias     apps="showdir $MY_CODE/apps"
alias     code="showdir $MY_CODE"
alias   review="showdir $MY_CODE/review"
alias      exp="showdir $MY_CODE/experiments"

## command shortcuts
alias         pd="perldoc"
alias         sl="sqlite3 "


#-------------------------
## OTHER
#-------------------------

## Open urls with command line
alias chrome="open -a 'Google Chrome.app' $@"
alias safari="open -a safari $@"


alias           hm='showdir ~ '
alias    downloads='showdir ~/Downloads '

#alias           mine="showdir $MY_CODE"
#alias          bashd="showdir $MY_CODE/myconfig/bash"
#alias           vimd="showdir $MY_CODE/myconfig/vim"
#alias         peruse="showdir $MY_CODE/Peruse"
#alias           mapi="showdir $MY_CODE/metacpan-c*"
#alias           mojo="showdir $MY_CODE/mojo-dev"
#alias           mweb="showdir $MY_CODE/metacpan-w*"
#alias           modi="showdir $MY_CODE/App-modinfo"

#alias          their="showdir $THIER_CODE"
#alias            js6="showdir $THIER_CODE/js/javascript6_examples/examples"
#alias         smooth="showdir $THIER_CODE/js/Smooth-CoffeeScript/src"
#alias          moose="showdir $THIER_CODE/perl/moose-presentations/moose-class/exercises"
#alias         goperl="showdir $THIER_CODE/perl"
#alias           gojs="showdir $THIER_CODE/js"
#alias         gonode="showdir $THIER_CODE/js/node"

#alias             es="showdir /usr/local/share/elasticsearch"



#----------------------------------
# END OF FILE
#----------------------------------
