

# AngularJS


# These aliases make setting up an angular project a snap


# make http://mbp point to build directory 
alias mbp2build='ns $(pwd)/build'

# dir2repo


# install and configure ngBoilerplate template via grunt-init
alias ngb='grunt-init ngb'

# install npm and bower packages then build, configure http://mbp and open url
alias ngb-install='npm i ; bower install ; grunt build ; mbp2build ; open http://mbp ;  git init ; git add . ; git ci -am "chore(*): new ng-boilerplate app" '



