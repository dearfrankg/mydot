

# MONGOLAB


# keys and passwords
#-----------------------------------------------------------------
export mongohq_api_key="rl5mbioglwzc5xk04cm5"
export mongolab_api_key="503f0450e4b04102cdfdc589"



# Commands
#-----------------------------------------------------------------

# This seems bogus
mlc () {

  [[ "$1" == "" ]] && echo "mlc(): need database param" && return

  echo "connecting to $1"
  mongo dbh86.mongolab.com:27867/$1 -u frankg -p frankg
}


alias ml-appseed='mongo dbh86.mongolab.com:27867/app-seed -u frankg -p frankg'
alias ml-crud='mongo ds031597.mongolab.com:31597/angular-crud-demo -u frankg -p frankg'
alias ml-dmo='mongo ds043977.mongolab.com:43977/dmo -u frankg -p frankg '
alias lm-presentations='mongo dbh84.mongolab.com:27847/presentations -u frankg -p frankg'


alias ml-modus='mongo ds027728.mongolab.com:27728/modus -u frankg -p frankg'

alias ml-aa=' mongo dbh76.mongolab.com:27767/angular-app -u frankg -p frankg'



alias ml-bpp='mongo ds031607.mongolab.com:31607/bp-production -u frankg -p frankg'
alias ml-bpd='mongo ds043957.mongolab.com:43957/bp-development -u frankg -p frankg'


# show how to restore mongolab from dump
alias mongo-restore='echo " mongorestore --host dbh84.mongolab.com --port 27847 --username frankg --password frankg --db presentations dump/presentations"'

alias foo='echo "
  mongorestore
      --host dbh84.mongolab.com
      --port 27847
      --username frankg
      --password frankg
      --db presentations dump/presentations
"
'


#-----------------------------------------------------------------
# Dates, JSON, Mongo
#-----------------------------------------------------------------

# js Date works in local time
# date = new Date()
#    Thu Mar 14 2013 01:28:26 GMT-0700 (PDT)
#
# js toJSON converts to UTC time
# jsonDate = date.toJSON()
#    "2013-03-14T08:27:57.655Z"
#
# js Date converts JSON back to local time
# new Date(jsonDate)
#    Thu Mar 14 2013 01:28:26 GMT-0700 (PDT)


# Mongo has a date object that is recommended to use because of the utilities it offers
# search by date, map reduce, etc...

# I choose to ignore it for now as it does not help my app.







