#!/bin/bash -f

##
## NAV MODULE make it easier to navigate directories
##



#-------------------------------------------------------------------------
# new filter commands
#-------------------------------------------------------------------------
alias ds='dir_story'
alias dg='deep_go'
alias pg='proj_go'
alias pl='proj_list'



#-------------------------------------------------------------------------
# Project List
#-------------------------------------------------------------------------
proj_list() {

  list=$(
    cd $proj
    data=""
    for x in 1 2 3 4 5
    do
      local cmd="find . -type d -depth $x "
      local dirs=$($cmd | grep 'git$' )
      [[ "$dirs" != "" ]] && data=$(echo -e "$data\n$dirs")
    done
    echo $data
    )

  clear
  line="-----------------------------------------------------------------------"
  printf "%-30s %s \n%s\n" "PROJECT NAME" "DESCRIPTION" "$line"
  for f in $list
  do
    projectDir=$(dirname $f)
    projectName=$(basename $projectDir)
    readmeFile="$proj/$projectDir/readme.md"

    [[ -f "$readmeFile" ]] && readme=$( grep '^[A-Z]' $readmeFile | head -n 1 ) || readme=""
    printf "%-30s %s \n" "$projectName" "$readme"
  done
  echo $line

}


#-------------------------------------------------------------------------
# cache - cache uses a sqlite database
#-------------------------------------------------------------------------
nav_db="/Users/frankg/.bash_custom/plugins/db/nav.db"

sqlite() {
  # usage: sqlite_get <dbfile> <cmd>
  #
  local db="$1"
  local sql="$2"

  # validation

  # first param must be file
  [[ -f "$db" ]] || { echo "sqlite_get(): first param must be a database file." && return 0; }

  sqlite3 "$db" "$sql"
}

ncache_list () {
  str="$1"
  sqlite "$nav_db" "select * from cache"
}

ncache_search () {
  str="$1"
  sqlite "$nav_db" "select * from cache where path like \"%$str%\""
}

ncache_set () {
  str="$1"
  sqlite "$nav_db" "insert into cache values('$str')"
}

ncache_clear () {
  str="$1"
  sqlite "$nav_db" "delete from cache"
}



proj_go () {

  cd $proj
  partial="$1"
  # goto default project directory unless partial param
  [[ "$partial" == "" ]] && { ll; splash; return 0; }

  # try cache
  local dir=$( ncache_search $partial | head -n 1 )
  echo "DIR: $dir"
  if [[ -d $dir ]]; then
    cd $dir
    splash
    echo "found in cache: $dir"
    return 0;
  fi

  # resort to search
  echo "searching for $partial"
  dir=$( deep_go $partial )
  if [[ -d $dir ]]; then
    ncache_set $dir
    cd $dir
    splash
    echo "found via search: $dir"
    return
  fi

  [[ ! -d $dir ]] && { echo "could not find matching directory with 5 levels"; return 0; }
}


deep_go () {
  local partial="$1"
  for x in 1 2 3 4 5
  do
    local cmd="find . -type d -depth $x "
    local dir=$($cmd | grep "$partial" | pcregrep -v '/\.' | head -n 1 )
    [[ -d $dir ]] && echo $dir && return
  done
}

go() {

  # get list of directories in the current directory

  for d in $(get_dirs)
  do
    local regex="$1"
    if [[ "$d" =~ "$regex" ]]; then
      cd $d
    fi
  done
}



