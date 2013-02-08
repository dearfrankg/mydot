
##
##
## PERSONAL FUNCTIONS
##
##









alias public-key="cat ~/.ssh/id_rsa.pub"
alias hosts='sudo vi /private/etc/hosts'
alias v="version"
alias sites="showdir ~/Sites"


##    sweep
##
##    description:
##    sweep screen1 pics into folder and removes screen2 pics
##
##    usage:
##    sweep folder_name
##
sweep () {
  local desktop="$HOME/Desktop"
  local dir="$desktop/$1"
  [[ -d $dir ]] && echo "directory: $1 already exists" && return

  find $desktop -name '*(2)*' -exec rm -f {} \;

  mkdir $dir
  mv $desktop/Scree* $dir
}

version() { 
  cmd="$1"
  $cmd --version
}

