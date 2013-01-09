
##
##
## PERSONAL FUNCTIONS
##
##



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


