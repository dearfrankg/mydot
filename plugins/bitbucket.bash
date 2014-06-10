
# Bit Bucket




bbcreate () {
  [ "$1" == "" ] && echo "forgot repo name" && return 
  cmd="curl -s --user dearfrankg@gmail.com:time4Bit https://bitbucket.org/api/1.0/repositories  --data name=$1 --data is_private=true "
  echo ` $cmd `
}

bbdelete () {
  [ "$1" == "" ] && echo "forgot repo name" && return 
  cmd="curl -s -X DELETE --user dearfrankg@gmail.com:time4Bit https://bitbucket.org/api/1.0/repositories/fgutierrez/$1"
  echo ` $cmd `
}





