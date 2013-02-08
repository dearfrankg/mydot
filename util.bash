#!/bin/sh
########################################################################
#
# utility functions
#
########################################################################

##------------------------------------------------------
##  ALIASES
##------------------------------------------------------
alias tt='tab_title'
alias splash='dir_story'
alias up='dir_up'
alias md='dir_into'
alias bt='big_tree'


##------------------------------------------------------
## DATE FUNCTIONS
##------------------------------------------------------
humanizeDuration() {
  [[ "$1" == "" ]] && { echo "humanizeDuration(): requires date parameter." && return 0; }
  moment="/Users/frankg/.nvm/v0.8.18/lib/node_modules/moment/moment"
  humanizedDate=$( node -e "var moment = require('$moment'); console.log( moment( process.argv[1] ).fromNow() );" "$1" )
  echo $humanizedDate
}

##------------------------------------------------------
##  DEV FUNCTIONS
##------------------------------------------------------

##    isFunction - identify functions
##
##    usage: isFunction foo && echo "yes" || echo "no"
##
isFunction() { [[ "$(declare -Ff "$1")" ]]; }


##------------------------------------------------------
##  UI FUNCTIONS
##------------------------------------------------------

## tab_title - set tab title in iTerm2
##
tab_title () { echo -ne "\033]0;$@\\007"; }


## finder - open finder window
##
finder() {
    if [[ "$1" ]]; then
        open -a finder $1
    else
        open -a finder $(pwd)
    fi
}


## showdir - navigate to a directory and show its contents
##
showdir() {
    local path=""
    if [[ "$1" != "" && "$2" != "" ]]; then
      path="$1/$2*"
    elif [[ "$1" != "" ]]; then
      path="$1*"
    fi
    cd $path
    ll
}

## path - pretty print $PATH
##
path() {                            # show path env data in a nice format
    perl -E ' $data = $ARGV[0]; $data =~ s/:/\n/g; say $data; ' $(echo $PATH)
}


## tree-color - tree output in color
##
tree-color() {
    /usr/local/bin/tree -C $@ | less -R
}



##------------------------------------------------------
##  DIRECTORY FUNCTIONS
##------------------------------------------------------

##    fuzzy_find - returns first file matching regex
##
##    usage:
##    file = fuzzy_find $path $regex
##
fuzzy_find() {

  # Validate path and query params
  [[ "$1" == "" || "$2" == "" ]] && echo "fuzzy_find(): requires path and query params" && return

  local path="$1/*"
  local query_regex="$2"

  for file in $path
  do

    # return first file that matches regex
    [[ -f "$file" && "$file" =~ "$query_regex" ]] && echo "$file" && return
  done

}

## big_tree - show tree of all-cap directories
##
big_tree () {
  find . -type d | perl -ne 'print if /^[._\/A-Z]+$/; '
}


## dir_story - summarize dirs using readme files
##
dir_story() {
  ll
  echo '-----------------------------------------------------------'
  for d in $(get_dirs)
  do
    local file="$d/README.md"
    local file_lower="$d/readme.md"
    if [[ -f "$file" ]]; then
      printf "% 40s:  %s \n" $d "`head -1 $file`"
    elif [[ -f "$file_lower" ]]; then
      printf "% 40s:  %s \n" $d "`head -1 $file_lower`"
    fi
  done
  echo '-----------------------------------------------------------'
}


## dir_up - move up one directory
##
dir_up () {
  cd ..
  splash
}


## dir_into - make dir and cd into it
##
dir_into () {
  if [[ -d "$1" || -f "$1" ]]; then
     echo "$1 already exists"
     return
  fi
  mkdir "$1"
  cd "$1"
}


## get_dirs - get list of directories in the current directory
get_dirs() {
  local list
  for f in *
  do
    if [[ -d "$f" ]]; then
      list="$list $f"
    fi
  done
  echo $list
}








#-------------------------------------------------------------------------
# SORTING FUNCTIONS
#-------------------------------------------------------------------------

## numeric_sort - list files sorted by leading digit
numeric_sort() {
    local perl1=' $l=$_; chomp $l; ($num) = $l =~ m/(\d+)/xms; say $num; '
    local perl2=' $l=$_; chomp $l; if ($l != "") { $cmd="ls $l-*"; system( $cmd); } '

    local list_files="find . -type f  "
    local map_to_leading_numbers=" perl -n -E '$perl1' "
    local sort_numerically=" sort -n "
    local map_to_ls_cmds=" perl -n -E '$perl2'"

    local cmd=" \
      $list_files | \
      $map_to_leading_numbers |\
      $sort_numerically | \
      $map_to_ls_cmds "

    eval $cmd
}









##--------------------------------------------------
## OTHER FUNCTIONS
##--------------------------------------------------


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# Frank::Utils functions
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
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
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
# Prompt functions
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
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
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


