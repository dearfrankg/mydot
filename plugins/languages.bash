
# PROGRAMMING LANGUAGE HELP

# - helper functions
# - virtual env setup scripts
# - etc.





# ---------------------------------------------
# BASH
# installed with OSX
# ---------------------------------------------



# ---------------------------------------------
# COFFEESCRIPT
# installed with npm    // npm -g install coffee-script
# ---------------------------------------------
alias cs='coffee '



# ---------------------------------------------
# NODE.JS
# installed with nvm
# ---------------------------------------------

##
## NVM
## setup node in a user environment
## https://github.com/creationix/nvm

#
# source nvm commands
#
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM


##
## helper functions for npm
##

#
# list installed global modules
#
alias npml='npm list --depth=0'

## THIS IS NOW DEPRECATED
# npml() {
#   NODE_HOME=$(dirname $( dirname $(which node)))
#   NPM_HOME="$NODE_HOME/lib/node_modules"
#   for f in $(ls $NPM_HOME)
#   do
#     echo $f
#   done
# }




# ---------------------------------------------
# JAVA
# installed jan-2014, with Oracle package installer
# http://goo.gl/TfUlf
# ---------------------------------------------



# ---------------------------------------------
# RUBY

#   rvm - the ruby virtual environment

#   install rvm       // \curl -sSL https://get.rvm.io | bash -s stable
#   install ruby      // rvm install 2.1.0                  (password may be required)
#   use ruby          // rvm use 2.1.0 --default
#   confirm           // ruby -v

#   optional install compass
#                     // gem update --system
#                     // gem install compass
#                     // # Downgrade sass because of an issue
#                     // gem uninstall sass --version 3.3.0.rc.2
#                     // gem install sass --version 3.2.13
#                     // compass -v # Working :)

# ---------------------------------------------
### DO NOT UNCOMMENT
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*



# ---------------------------------------------
# PYTHON
# no virtual env setup
# ---------------------------------------------



# ---------------------------------------------
# PERL
# no virtual env setup
# ---------------------------------------------









# OLD STUFF BELOW
###################################
##################################


##
## Ruby Perl and Python disabled for now
##


# #---------------------------------------------
# # RUBY
# #---------------------------------------------

# # rvm - ruby management tool
# source $(rvm ruby-2.1.2 do rvm env --path)
# [[ -r /scripts/completion ]] && source /scripts/completion

# # rvm help
# #
# #    list installed    rvm list
# #    list available    rvm list known
# #    install           rvm install 9.3.1-head
# #    uninstall         rvm uninstall 9.3.1
# #
# #


# #---------------------------------------------
# # PERL
# #---------------------------------------------

# # perlbrew
# # both lines are required
# export PERLBREW_ROOT="$HOME/.perl5"
# source $HOME/.perl5/etc/bashrc


# #---------------------------------------------
# # PYTHON
# #---------------------------------------------

#   ##
#   ## First install attempt
#   ##
#               # python virtual env support kinda sucks
#               #
#               # see virtualenv and virtualenvwrapper
#               #
#               # http://virtualenvwrapper.readthedocs.org/en/latest/#
#               #
#               # holding off installing anything here until things improve

#   ##
#   ## Second install attempt
#   ##

#   # config instructions:
#   # http://goo.gl/0O6Zd

# export WORKON_HOME=$HOME/.virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh


# # mkvirtualenv <name>
# # rmvirtualenv <name>
# # workon [ <name> ]
# # deactivate





########################################
# END OF FILE
########################################
