#!/bin/sh

##--------------------------------------------------
##
## GLOBAL BASH SETTINGS  --- DO NOT STORE PERSONAL SETTINGS IN HERE
##
##--------------------------------------------------

#DEBUG=1
if [ "$DEBUG" == "1" ]; then
    echo "loading global bash settings"
fi

##--------------------------------------------------
#
# SOME VITAL ELEMENTS FIRST
#
##--------------------------------------------------
MYBASH="$HOME/.bash_custom"
GB="$MYBASH/global.bash"
LB="$MYBASH/local.bash"


##--------------------------------------------------
## install additional functions from the plugins directory
##--------------------------------------------------
load_plugins() {
    for p in $MYBASH/plugins/*.global.bash
    do
        # source the plugin
        . $p
    done
}

##--------------------------------------------------
#
# SOME VITAL ELEMENTS FIRST
#
##--------------------------------------------------
BASH_GIT_SAVE="save_repo_changes $MYBASH"

# aliases to edit bash config
alias  gbash=" vi $GB; . $GB; $BASH_GIT_SAVE "
alias  lbash=" vi $LB; . $LB; $BASH_GIT_SAVE "

if [ 1 == 1 ]; then

    # load global functions
    load_plugins

    # git prompt
    export PS1="\[\e[0;31m\]\u@\h:\[\e[0;32m\]\W\[\e[0;34m\]\$(git_parse_branch)\[\e[00m\]$"

else

    # normal prompt
    export PS1="\[\e[0;31m\]\u@\h:\[\e[0;32m\]\W\[\e[0;34m\]\[\e[00m\]$"
fi


##--------------------------------------------------
#
# SOME BASICS FIRST
#
##--------------------------------------------------

# ENV Vars
export TERM="xterm-256color"

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

alias ack='ack -a '

## Open urls with command line
alias chrome="open -a 'Google Chrome.app' $@"
alias safari="open -a safari $@"


##--------------------------------------------------
##
## APP SPECIFIC
##
##--------------------------------------------------


# git
alias gc='vi ~/.gitconfig'

#nginx
alias nginx_conf="vi /usr/local/etc/nginx/nginx.conf"




#---------------------------------------------
# IF REDHAT OS THEN DO THIS STUFF
#---------------------------------------------
if [ -f "/etc/redat-release" ]; then


    # vsftpd
    alias vs='cd /etc/vsftpd/ '
    alias vse='sudo vi /etc/vsftpd/vsftpd.conf '


    # yum
    alias yums='sudo yum search '
    alias yumi='sudo yum -y install '


    # apache
    alias web='cd /var/www/html'
    alias webe='sudo vim /etc/httpd/conf/httpd.conf '
    alias webc='cd /etc/httpd/conf.d '
    alias webrs='sudo service httpd restart '
    alias netrs='sudo service network restart ; ifconfig  '


    # wordpress
    alias wp='cd /usr/share/wordpress/wp-content/ '
    alias wpe='sudo vi /etc/wordpress/wp-config.php '

fi
#---------------------------------------------


##---------------------
## END OF FILE
##---------------------













