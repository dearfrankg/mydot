




#-------------------------------------------------------------------------
# cache - cache in this case is the mongo db
#-------------------------------------------------------------------------
get_cache () {
  local cmd="
use macbook
db.gopath.findOne({ path: { \$regex: \".*$1.*\" }}, { _id: 0})
"
  local result=$( echo "$cmd" | mongo --quiet )
  local regex='([^"]+)"[^"]*$'
  [[ $result =~ $regex ]] && echo ${BASH_REMATCH[1]}
}


set_cache () {
  local cmd="
use macbook
db.gopath.insert({ path: \"$1\" })
"
  echo "$cmd" | mongo --quiet
}


#-------------------------------------------------------------------------
# new filter commands
#-------------------------------------------------------------------------
alias dg='deep_go'
alias pg='proj_go'

proj_go () {

  local dir
  proj  # cd to proj root

  [[ "$1" == "" ]] && splash && return 0


  # use cache if you can
  dir=$( get_cache $1 )
  if [[ ! -d $dir ]]; then

    # do it the hard way
    dir=$( deep_go $1 )
    [[ -d $dir ]] && set_cache $dir

  fi

  cd $dir
  splash
}

deep_go () {
  for x in 1 2 3 4 5
  do
    local cmd="find . -type d -depth $x "
    local dir=$($cmd | grep "$1" | grep -vP '/\.' | head -n 1 )
    [[ -d $dir ]] && echo $dir && return
  done
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


