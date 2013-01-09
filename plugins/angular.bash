# angular bash plugin

cap () { 

  local proj="coffee angular project"
  local seed="/Users/frankg/dev/code/projects/lab/JAVASCRIPT/ANGULAR/SEEDS/yeo-simple"
  [[ "$1" == "" ]] && echo "$proj - cap(): requires project name param" && return

  local cmd="git clone $seed $1"
  $cmd
  cd $1
}

