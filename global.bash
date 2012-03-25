#!/bin/sh

##--------------------------------------------------
##
##
##
## GLOBAL BASH SETTINGS  --- DO NOT STORE PERSONAL SETTINGS IN HERE
##
##
##
##--------------------------------------------------

##--------------------------------------------------
#
# SOME BASICS FIRST
#
##--------------------------------------------------


# ENV Vars
export TERM="xterm-256color"

# vim
alias   vimrc="vim $HOME/.vimrc "
alias  bundle="cd $HOME/.vim/bundle; ll "
alias      vi="vim $@"


# bash
alias ll="clear; pwd; ls -lG "
alias ls="clear; pwd; ls -G "
alias la="clear; pwd; ls -alG "
alias env='env | sort '


# shortcuts to edit custom bash files
MYBASH="$HOME/.bash_custom"
GB="$MYBASH/global.bash"
GF="$MYBASH/global_functions.bash"
LB="$MYBASH/local.bash"
LF="$MYBASH/local_functions.bash"
alias  gbash=" vi $GB; . $GB "
alias  gfunc=" vi $GF; . $GF "
alias  lbash=" vi $LB; . $LB "
alias  lfunc=" vi $LF; . $LF "




# normal prompt
export PS1="\[\e[0;31m\]\u@\h:\[\e[0;32m\]\W\[\e[0;34m\]\[\e[00m\]$"

##--------------------------------------------------
#
# IMPORT OTHER SCRIPTS
#
##--------------------------------------------------

#export DEBUG=1

if [ -s "$GF" ]; then
    source $GF              # GLOBAL BASH FUNCTIONS

    # git prompt
    export PS1="\[\e[0;31m\]\u@\h:\[\e[0;32m\]\W\[\e[0;34m\]\$(git_parse_branch)\[\e[00m\]$"
fi

if [ "$DEBUG" == "1" ]; then
    echo "loading global bash settings"
fi


##--------------------------------------------------
##
##
##
## APP SPECIFIC
##
##
##
##--------------------------------------------------


# git
alias gc='vi ~/.gitconfig'

# tree
alias otree='/usr/local/bin/tree'

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













