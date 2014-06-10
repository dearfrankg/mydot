
################################################
##
## Plugin System for bash
##
##
## Purpose: Allow loading of plugin functionality
## Author: Frank Gutierrez
## last_edited: JAN-2013
##
################################################


alias pll='plugin_list'
alias pe='plugin_edit'
alias pd='plugin_dir'


# identify a list of plugins to load
DEFAULT_LIST="/Users/frankg/.bash_custom/plugins"



## load all plugins identified by the list param or DEFAULT_LIST
##
plugin_load_all() {
  local list="$1"
  [[ $list == "" ]] && list="$DEFAULT_LIST"
  list="$list/*"

  foo=0
  for p in $list
  do
    if [[ -f "$p" ]]; then
      # source the plugin
      foo=$(($foo + 1))
      #echo "$foo loading plugin $(basename $p)"
      source $p
    fi
  done
}

## goto plugin directory
##
plugin_dir () {
  cd $DEFAULT_LIST
}


## list plugins
##
plugin_list () {
  ll $DEFAULT_LIST
}


## edit a plugin using fuzzy search
##
plugin_edit() {

  # file_regex validation
  [[ "$1" == "" ]] && echo "plugin_edit(): requires file_regex param" && return

  local file_regex="$1"
  file=$(fuzzy_find $DEFAULT_LIST $file_regex)

  # no files matched - ask to create
  if [[ "$file" == "" ]]; then
    yesno "create file: $file_regex" || return 0;
    file="$MYBASH/plugins/$file_regex.bash"
  fi


  vi $file; source $file; save_repo_changes $MYBASH

}

########################################################
########################################################

#------------------
# load on start
#------------------
plugin_load_all
