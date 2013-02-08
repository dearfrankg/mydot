#!/bin/bash
# meteor.bash

heroku_create_meteor() {

  [[ "$1" == "" ]] && { echo "heroku_create_meteor(): requires an app_name parameter."; return 0; }

  cmd=" heroku create $1 --stack cedar --buildpack https://github.com/jordansissel/heroku-buildpack-meteor.git"

  $cmd

}



