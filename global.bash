#!/bin/sh
##--------------------------------------------------
##
## GLOBAL BASH SETTINGS  --- DO NOT STORE PERSONAL SETTINGS IN HERE
##
##--------------------------------------------------



# BASH SYSTEM LOADING FLOW
#
#   1) GBASH => SOURCE UBASH 
#   2) $HOME/.bash_profile => SOURCE LBASH => SOURCE PBASH
#


##--------------------------------------------------
## GLOBAL SETTINGS
##--------------------------------------------------
export TERM="xterm-256color"


##--------------------------------------------------
## KEY ALIASES AND VARIABLES
##--------------------------------------------------

# vim
alias         vi="mvim -v $@"
alias        vim="mvim -v $@"
alias      vimrc="vim $HOME/.vimrc "
alias  vimbundle="showdir $HOME/.vim/bundle $@ "

# bash
alias lo="clear; pwd; ls * -G "
alias ll="clear; pwd; ls -lG "
alias ls="clear; pwd; ls -G "
alias la="clear; pwd; ls -alG "
alias env='env | sort  '

export PS1="\[\e[0;31m\]\u@\h:\[\e[0;32m\]\W\[\e[0;34m\]\[\e[00m\]$"                         # normal prompt

if [[ $(id -un) == "fguti7177561" ]]; then

  MYBASH="$HOME/.bash_custom"
  GB="$MYBASH/global.bash"
  LB="$MYBASH/local.bash"
  UB="$MYBASH/util.bash"
  PB="$MYBASH/plugin_system.bash"


  ##--------------------------------------------------
  ## UTIITIES 
  ##--------------------------------------------------

  source $UB      # load key utilities

  ##--------------------------------------------------
  ## CUSTOM BASH SYSTEM
  ##--------------------------------------------------

  alias  gbash=" vi $GB; . $GB; save_repo_changes $MYBASH "
  alias  lbash=" vi $LB; . $LB; save_repo_changes $MYBASH "
  alias  ubash=" vi $UB; . $UB; save_repo_changes $MYBASH "
  alias  pbash=" vi $PB; . $PB; save_repo_changes $MYBASH "

  
  ##--------------------------------------------------
  ## PROMPT
  ##--------------------------------------------------

  source $MYBASH/plugins/git.bash
  isFunction git_parse_branch && 
  isFunction git_dirty && 
  export PS1="\[\e[0;31m\]\u@\h:\[\e[0;32m\]\W\[\e[0;34m\]\$(git_parse_branch)\$(git_dirty)\[\e[00m\]$"  # git prompt

fi

##---------------------
## END OF FILE
##---------------------













