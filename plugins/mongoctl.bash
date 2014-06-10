
#     NAME:

#         mongoctl - Manage MongoDB servers and replica sets using JSON configurations!


#     INSTALL and CONFIGURE

#         web page:

#             - https://github.com/mongolab/mongoctl


#         Installing mongoctl



#             Dependency:

#                 - pip   // https://github.com/mongolab/mongoctl/blob/master/docs/installing-pip.md


#                 cd /tmp
#                 git clone https://github.com/pypa/pip.git
#                 cd pip
#                 sudo python setup.py install




#             mongoctl is registered in the Python package index pypi.

#             To install
#             % sudo pip install mongoctl
#             % mongoctl install-mongodb

#             To update:
#             % sudo pip install --upgrade mongoctl

#             To uninstall:
#             % mongoctl uninstall-mongodb
#             % sudo pip uninstall mongoctl





#     USAGE:

#         mc arg  // mongoctl command
#         mcst    // check status
#         mcs     // start MongoDB
#         mcq     // quit MongoDB
#         mcc     // start mongodb console





#-------------------------------------------------
#
#       BELOW IS VARIOUS DB PROCESSES
#
#-------------------------------------------------



# mongoctl
# --------------------

#     ................................
#     find array length

#     db.events.find({ $where: "this.fights.length == 0" }).count()
#     # note all docs must have array

#     ................................
#     find field length

#     db.cache({ $where: "this.value < 100" }).count()
#     # note all docs must have the field

#     ................................
#     update all

#     db.events.update({}, {$set: {fights: []}}, {multi: true})




#     ................................
#     use functions

#     function showEvents() { return db.events.find() }

#     later...
#     showEvents()



#     ................................
#     Does field exist

#     db.cache.find( { value: { $exists: true }} )





#------------------------------------------------
# mc     (alias)
#
# mongoctl
#
# Swiss army knife for mongodb
#------------------------------------------------
alias mc='mongoctl'
alias mcs='mc start MyServer '
# NOTE: don't bother trying to use the useless built in rest server!!
alias mcq='mc stop MyServer'
alias mcst='mc status MyServer'
alias mcc='mc connect MyServer'

# mc dump    -o folder
# mc restore path/to/bson/file
#
#...............................
#------------------------------------------------------




#------------------------------------------------
# mi     (alias)
#
# mongodbimport
#
# Import data into mongodb
#------------------------------------------------
export PATH="$PATH:$HOME/mongodb/mongodb-osx-x86_64-2.2.3/bin"
alias mi='mongodbimport'
#
#  Convert a json stringified file to a json-ugly format
#  that means one record per line
#
#  cat data.json | json -u -a > results.json
#  -u = ugly format
#  -a = the file is an array of objects
#
#  Import the file into the mongodb database
#
#  mi -d ufc -c events --file results.json
#------------------------------------------------------





#------------------------------------------------------
# mr  (alias)
#
# mongodb-rest
#
#   1) makes mongodb available via rest api.
#   2) serves public folder (I'm using nginx instead)
#------------------------------------------------------
alias mr='mongodb-rest'
#...............................
# Startup instructions
# cd ufc
# mr
#...............................
#
# Access the db via REST
#
#  GET /db/collection - Returns all documents
#  GET /db/collection?query=%7B%22isDone%22%3A%20false%7D - Returns all documents satisfying query
#  GET /db/collection?query=%7B%22isDone%22%3A%20false%7D&limit=2&skip=2 - Ability to add options to query (limit, skip, etc)
#  GET /db/collection/id - Returns document with id
#  POST /db/collection - Insert new document in collection (document in POST body)
#  PUT /db/collection/id - Update document with id (updated document in PUT body)
#  DELETE /db/collection/id - Delete document with id
#
#  curl http://localhost/db/collection
#------------------------------------------------------
