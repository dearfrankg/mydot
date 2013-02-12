#
# This is for supporting language environments
#

# benefit: avoid messing with system tools
# benefit: avoid the need to use root power
# benefit: keep many versions of the language






#---------------------------------------------
# BASH
#---------------------------------------------




#---------------------------------------------
# COFFEESCRIPT
#---------------------------------------------
alias cs='coffee '


#---------------------------------------------
# NODE.JS
#---------------------------------------------

# nvm - node management
################################################
#   https://github.com/creationix/nvm
#   handles managing node in a user environment
[[ -s /Users/frankg/.nvm/nvm.sh ]] && . /Users/frankg/.nvm/nvm.sh

# bash-completion auto-generated stuff
################################################
# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}

##
## NPM
##

alias npm='npm -q '
alias npmgi='npm -g install '
alias npmi='npm install '

# npml - list installed global modules
################################################
#
npml() {
  NODE_HOME=$(dirname $( dirname $(which node)))
  NPM_HOME="$NODE_HOME/lib/node_modules"
  for f in $(ls $NPM_HOME)
  do
    echo $f
  done
}






#---------------------------------------------
# RUBY
#---------------------------------------------

# rvm - ruby management tool
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
source $(rvm 1.9.3 do rvm env --path)
[[ -r /scripts/completion ]] && source /scripts/completion

# rvm help
#
#    list installed    rvm list
#    list available    rvm list known
#    install           rvm install 9.3.1-head
#    uninstall         rvm uninstall 9.3.1
#
#





#---------------------------------------------
# PERL
#---------------------------------------------

# perlbrew
source ~/perl5/perlbrew/etc/bashrc







#---------------------------------------------
# PYTHON
#---------------------------------------------

# python virtual env support kinda sucks
#
# see virtualenv and virtualenvwrapper
#
# http://virtualenvwrapper.readthedocs.org/en/latest/#
#
# holding off installing anything here until things improve







#---------------------------------------------
# JAVA
#---------------------------------------------














########################################
# END OF FILE
########################################
