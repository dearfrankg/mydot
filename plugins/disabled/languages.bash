
##-------------------------------------------------------------------
##
## SETUP ENVIRONMENT
##
##-------------------------------------------------------------------

##---------------------------------------
## JAVASCRIPT
##---------------------------------------

# Node was installed at /usr/local/bin/node
# npm was installed at /usr/local/bin/npm
# Make sure that /usr/local/bin is in your $PATH.



##---------------------------------------
## JAVA
##---------------------------------------

classpath="$exp/dev-skills/oo-design-patterns"
export WORK=$classpath/FG_DP/src/frankMade
export CLASSPATH="$classpath/HF_DP/bin:$classpath/FG_DP/bin"


##---------------------------------------
## PERL
##---------------------------------------

# perlbrew
export PERLBREW_ROOT=$MY_LIB/perl5
source $PERLBREW_ROOT/etc/bashrc

#cpanm defaults
export PERL_CPANM_OPT="-nq"

# cpanm auto-completion
source setup-bash-complete



##---------------------------------------
## RUBY
##---------------------------------------

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
rvm use 1.9.3 2>&1 > /dev/null



##-------------------------------------------------------------------
##
## SETUP FUNCTIONS
##
##-------------------------------------------------------------------


## pv - show perl version for a module - ex: pv CGI
##
pv() {
    perl -e "use $1 9999;"  2>&1 \
    | perl -ne ' ($a) = /(version [\d.]+) at/;  print "$a\n" if $a; '
}


