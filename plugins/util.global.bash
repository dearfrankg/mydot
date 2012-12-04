#!/bin/sh
########################################################################
#
# utility functions
#
########################################################################



alias cr='create_readme'
#-------------------------------------------------------------------------
# make README.md
#-------------------------------------------------------------------------
create_readme () {
  [[ -f "README.md" ]] && echo "file exists." && return
  echo "$1" > README.md
}


#-------------------------------------------------------------------------
# mdb mongo db execute
#-------------------------------------------------------------------------
mdb () {
  if [[ ! "$1" && "$2" ]]; then
    echo "mdb needs db and query params" && return 0
  fi
  echo "executing..."
}









#-------------------------------------------------------------------------
# new filter commands
#-------------------------------------------------------------------------
alias dg='deep_go'
alias pg='proj_go'

proj_go () {
  proj 
  [[ "$1" != "" ]] && deep_go $1
  splash
}

deep_go () {
  for x in 1 2 3 4 5
  do
    local cmd="find . -type d -depth $x "
    local dir=$($cmd | grep "$1" | grep -vP '/\.' | head -n 1 )
    [[ -d $dir ]] && cd $dir && return
  done
  echo "directory [$1] not found"
}

splash () {
  for dir in $(get_dirs)
  do
    [[ -f $dir/readme.md || -f $dir/README.md ]] && dir_story && return
  done
  ll
}










#-------------------------------------------------------------------------
# list based on leading digit
#-------------------------------------------------------------------------
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

#-------------------------------------------------------------------------
# Change to the parent directory
#-------------------------------------------------------------------------
up () {
  cd ..
  splash
}

#-------------------------------------------------------------------------
# Make dir and cd into it
#-------------------------------------------------------------------------
md () {
  if [[ -d "$1" || -f "$1" ]]; then
     echo "$1 already exists"
     return
  fi
  mkdir "$1"
  cd "$1"
}

#-------------------------------------------------------------------------
# Set tab title in iTerm2
#-------------------------------------------------------------------------
tt () { echo -ne "\033]0;$@\\007"; }

#-------------------------------------------------------------------------
# Open all files in names directory
#-------------------------------------------------------------------------
vb() {
  local dir='.'
  if [[ -d "$1" ]]; then
    dir=$1
  fi
  vim $(find $dir ! -path '*.git*' -type f )
}

#-------------------------------------------------------------------------
# get list of directories in the current directory
#-------------------------------------------------------------------------
go() {
  for d in $(get_dirs)
  do
    local regex="$1"
    if [[ "$d" =~ "$regex" ]]; then
      cd $d
    fi
  done
}




#-------------------------------------------------------------------------
# get list of directories in the current directory
#-------------------------------------------------------------------------
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
# summarize the story on the directories by using the readme.md files
#-------------------------------------------------------------------------
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


#-------------------------------------------------------------------------
# Open finder window at cwd or path
#-------------------------------------------------------------------------
finder() {
    if [[ "$1" ]]; then
        open -a finder $1
    else
        open -a finder $(pwd)
    fi

}

#-------------------------------------------------------------------------
# Prove we can output color
#-------------------------------------------------------------------------
col() {
    echo -e "\033[1;31m$1\033[m"
}

#-------------------------------------------------------------------------
# Pretty print $PATH
#-------------------------------------------------------------------------
path() {                            # show path env data in a nice format
    perl -E ' $data = $ARGV[0]; $data =~ s/:/\n/g; say $data; ' $(echo $PATH)
}

#-------------------------------------------------------------------------------------------------------------
# tree output in color
#-------------------------------------------------------------------------------------------------------------
tree-color() {
    /usr/local/bin/tree -C $@ | less -R
}

#-------------------------------------------------------------------------------------------------------------
# navigate to a directory and show its contents
#-------------------------------------------------------------------------------------------------------------
showdir() {
    cd
    if [ "$1" != "" -a "$2" != "" ]
    then
        DIR="$1/$2*"
        cd $DIR
    elif [ "$1" != "" ]
    then
        DIR="$1*"
        cd $DIR
    fi
    ll
}

#-------------------------------------------------------------------------------------------------------------
# Frank::Utils functions
#-------------------------------------------------------------------------------------------------------------
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
#-------------------------------------------------------------------------------------------------------------


#-------------------------------------------------------------------------------------------------------------
# Prompt functions
#-------------------------------------------------------------------------------------------------------------
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
#-------------------------------------------------------------------------------------------------------------


#-------------------------------------------------------------------------------------------------------------
# Use url to pretty print json
#-------------------------------------------------------------------------------------------------------------
get_json() {
    curl -s $1 | json_xs
}

