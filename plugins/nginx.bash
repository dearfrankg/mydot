
#   nginx


# 	Install and Configure:

# 		Install 			// brew install nginx
# 		edit /etc/hosts 	// added my hostname 'mbp'
# 		edit nginx.conf 	// changed to port 80
# 		start server		// nginx-start
# 		test server			// open http://mbp

# 	Info:

# 		brew hardcodes the following

# 			- prefix path: 	/usr/local/Cellar/nginx/1.4.4
# 			- config file: 	/usr/local/etc/nginx/nginx.conf

# 		the relative paths of interest:

# 			- bin/nginx 		// I guess brew wires up the path
# 			- html 				// a symlink pointing to /var/www

# 	Usage:

# 		start: 		nginx-start
# 		stop:		nginx-quit
# 		reload:		nginx-reload
# 		config: 	nginx-conf
# 		serve dir:	ns <path>




alias nginx-conf="sudo subl /usr/local/etc/nginx"
alias nginx-goconf="cd /usr/local/etc/nginx"
alias nginx-start="sudo nginx"
alias nginx-quit="sudo nginx -s quit"
alias nginx-reload="sudo nginx -s reload"
alias ns='nginx_set_symlink'
alias nserve='ns $(pwd)'

nginx_set_symlink () {
  [[ "$1" == "" ]] && { echo "nginx_set_symlink (): requires a path parameter"; return 0; }
  PUBLIC='/Users/frankg/.nginx'
  rm -f $PUBLIC

  cmd="ln -v -s $1 $PUBLIC"
  echo $cmd
  $cmd


  ls -l $PUBLIC
#  ll $PUBLIC
}





