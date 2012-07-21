#!/bin/sh

#######################################
# local functions for my bash environment
#######################################

if [ "$DEBUG" = 1 ]; then
    echo "loading local bash functions"
fi

##---------------------------------------------------------------------------
##
## Frank::Utils functions
##
fg_replace_name() {
    perl -e 'use Frank::Utils qw(:all); reg_replace_file_name(); ' $@
}
fg_replace_text() {
    perl -e 'use Frank::Utils qw(:all); reg_replace_file_text(); ' $@
}
fg_get_from_prompt() {
    perl -e 'use Frank::Utils qw(:all); get_from_prompt(); ' $@
}
fg_versions() {
    perl -e 'use Frank::Utils qw(:all); language_versions(); ' $@
}
fg_append_file() {
    perl -e 'use Frank::Utils qw(:all); append_file(); ' $@
}
fg_prepend_file() {
    perl -e 'use Frank::Utils qw(:all); prepend_file(); ' $@
}
##
##---------------------------------------------------------------------------


install_theme() {                   # install octopress theme
    ##
    ## INSTALL OCTOPRESS THEME
    ##
    # reference: https://github.com/tommy351/Octopress-Theme-Slash.git .themes/
    prompt "Enter URL for theme"
    URI=$RESPONSE
    NAME=$( perl -e '$name=$ARGV[0]; $name=~s|.*/||; print $name; ' $URI  )
    CMD="git clone --quiet $URI.git .themes/$NAME"
    echo $CMD
    eval $CMD
    rake install["$NAME"]
    rake generate
}


prompt() {                          # prompt for response get answer in $RESPONSE
    ##
    ## PROMPT FOR A RESPONSE PUTTING THE RESULT IN $RESPONSE ENV VAR
    ##
    RESPONSE=""
    echo $1
    read a
    RESPONSE="$a"
}

#rm() {                      # removed fies will be moved to /tmp/trash
#    # make sure the trash dir exists
#    if [ ! -d /tmp/trash ]; then
#        echo "creating /tmp/trash"
#        mkdir /tmp/trash
#    fi

#    # gulp the -f or -rf option
#    if [ "$1" == "-f" -o "$1" == "-rf" ]; then
#        shift
#    fi


#while (( "$#" )); do

#    # show and execute the command
#    /bin/rm -rf /tmp/trash/$1
#    cmd="mv $1 /tmp/trash"
#    echo $cmd
#    eval $cmd

#    shift

#done


#}




