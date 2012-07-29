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

get_json() {
    curl -s $1 | json_xs
}

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


promptweb() {
    yesno "Open web page $1" $2 && chrome $1
}

yesno() {                          # prompt return true or false
    if [ "$2" == "" ]; then
        prompt "$1 y/n? [y]"
        case $RESPONSE in
            n|N|no|NO)  return 1 ;;
            *)          return 0 ;;
        esac
    else
        prompt "$1 y/n? [n]"
        case $RESPONSE in
            y|Y|yes|YES)  return 0 ;;
            *)            return 1 ;;
        esac
    fi
}

prompt() {                          # prompt return $RESPONSE
    RESPONSE=""
    echo $1
    read a
    RESPONSE="$a"
}

