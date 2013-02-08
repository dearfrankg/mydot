# angular bash plugin


## cap - create angular/coffee project using seed
##
cap () {

  # hard coded seed directory -- eeek
  local seed="/Users/frankg/dev/code/projects/lab/JAVASCRIPT/ANGULAR/SEEDS/yeo-simple"
  local error="cap(): requires a description param - 'name - desc'"

  # validate params
  description="$1"
  name=$(expr "$description" : '\(.*\s*\)-')
  [[ "$name" == "" || "$description" == "" ]] && echo $error && return

  # clone seed project
  git clone $seed $name
  cd $name 

  # create a readme file
  echo $description > readme.md
}

