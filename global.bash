#!/bin/sh

##--------------------------------------------------
##
## GLOBAL BASH SETTINGS  --- DO NOT STORE PERSONAL SETTINGS IN HERE
##
##--------------------------------------------------

#DEBUG=1
[[ "$DEBUG" == "1" ]] && echo "loading global bash settings"


##--------------------------------------------------
##
## GLOBAL SETTINGS
##
##--------------------------------------------------
export TERM="xterm-256color"


##--------------------------------------------------
##
## GLOBAL EDITING ALIASES
##
##--------------------------------------------------


# vars pointing to dirs and files
MYBASH="$HOME/.bash_custom"
GB="$MYBASH/global.bash"
LB="$MYBASH/local.bash"
PB="$MYBASH/plugins/util.global.bash"


##--------------------------------------------------
# aliases to edit bash config
##--------------------------------------------------
alias  gbash=" vi $GB; . $GB; save_repo_changes $MYBASH "
alias  lbash=" vi $LB; . $LB; save_repo_changes $MYBASH "
alias  pbash=" vi $PB; . $PB; save_repo_changes $MYBASH "


##--------------------------------------------------
## Declare and execute load_plugins()
##--------------------------------------------------
load_plugins() {
    for p in $1
    do
        # source the plugin
        # echo "loading plugin $p"
        . $p
    done
}
load_plugins "$MYBASH/plugins/*.global.bash"

##--------------------------------------------------
## Configure prompt
##--------------------------------------------------
# git prompt
export PS1="\[\e[0;31m\]\u@\h:\[\e[0;32m\]\W\[\e[0;34m\]\$(git_parse_branch)\[\e[00m\]$"

# normal prompt
#export PS1="\[\e[0;31m\]\u@\h:\[\e[0;32m\]\W\[\e[0;34m\]\[\e[00m\]$"


##--------------------------------------------------
##
## GLOBAL ALIASES
##
##--------------------------------------------------

# vim
alias         vi="mvim -v $@"
alias        vim="mvim -v $@"
alias      vimrc="vim $HOME/.vimrc "
alias  vimbundle="showdir $HOME/.vim/bundle $@ "

# bash
alias ll="clear; pwd; ls -lG "
alias ls="clear; pwd; ls -G "
alias la="clear; pwd; ls -alG "
alias env='env | sort  '

# ack
alias ack='ack -a '

## browser open
alias chrome="open -a 'Google Chrome.app' $@"
alias safari="open -a safari $@"

# git
alias gc='vi ~/.gitconfig'

# grunt
alias grunt="grunt --no-color "     # solarized bug cause prompt to be invisible in color, so we use the --no-color option 

# npm 
alias npm="npm -q"                  # shut up the noisy npm

#nginx
alias nginx_conf="vi /usr/local/etc/nginx/nginx.conf"


##---------------------
## END OF FILE
##---------------------













