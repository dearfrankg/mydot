
# nginx 

alias nginx-conf="sudo vi /usr/local/etc/nginx/nginx.conf"
alias nginx-start="sudo nginx"
alias nginx-quit="sudo nginx -s quit"
alias nginx-reload="sudo nginx -s reload"
alias n2p="nginx-quit; pow-start"
alias ns='nginx_set_symlink'

nginx_set_symlink () {
  [[ "$1" == "" ]] && { echo "nginx_set_symlink (): requires a path parameter"; return 0; }
  PUBLIC=~/Sites/public
  rm -f $PUBLIC
  cmd="ln -s $1 $PUBLIC"
  #echo $cmd
  $cmd
  ll $PUBLIC
}





