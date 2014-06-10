
# REST API NOTES
# =====================================


# Adventure Into The REST Rabit Hole
# -------------------------------------

# It started with mongodb-rest

# GET /db/collection - Returns all documents
# GET /db/collection?query=%7B%22isDone%22%3A%20false%7D - Returns all documents satisfying query
# GET /db/collection?query=%7B%22isDone%22%3A%20false%7D&limit=2&skip=2 - Ability to add options to query (limit, skip, etc)
# GET /db/collection/id - Returns document with id
# POST /db/collection - Insert new document in collection (document in POST body)
# PUT /db/collection/id - Update document with id (updated document in PUT body)
# DELETE /db/collection/id - Delete document with id

# It works easily but has a few quirks

#   - annoying launch message

#   - annoying deprecation message

# This mongodb-rest module is not the best.  Eventually write your own ( http://goo.gl/Evm5y ) ( http://goo.gl/faaYY )


# Encode and Decode URLs
# --------------------------

# Google took me to a guy that made some aliases urlencode and urldecode.
# They work but they are clunky

# Then I notice a curl command that did the same

#   curl -G --data-urlencode 'where={"first_name" : { "$regex" : "^\QJ\E" } }' https://api.parse.com/1/users/

# Add -v to become verbose and you will see:

#   GET /1/users/?where=%7B%22first_name%22%20%3A%20%7B%20%22%24regex%22%20%3A%20%22%5E%5CQJ%5CE%22%20%7D%20%7D


# Detour Into Performance
# ----------------------------

# Started that with the chrome extension 'page-speed'

#   - details on page-speed in my page-speed notes

#   - use nginx to gzip and set expire headers for internal or external REST apis

# For a while I was thinking, if I want just a list of names, why am I sending over the whole database.

# I started investiating a query or search command for my REST api.

# Eventually found my way to a conversation here: ( http://goo.gl/sV5ZN ).  In a nutshell it said:

#   "General $regex queries are generally discouraged, since they are very expensive and don't scale well."

# Questions started to fly out:

#   - If nginx's expire-header works then it's a one shot deal.

#   - But what if it's a million records?  Can you say time for paging.

#   - Even if it's a small collection - 5 million names doesn't sound good.

# Answers

#   - don't worry about the query or search feature for now.

#   - use nginx expire-headers

#   - use limit and skip options  (paging)

# After another look at the data - 300 small records is not that bad.

# Confirm sizes as adding bogos data can cause huge problems.








