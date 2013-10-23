#----------------------------------------------
# PAGE SPEED NOTES 
#----------------------------------------------
<<XXX



SUMMARY
-----------

scale images: sips
optimize images: yeoman
concatination: yeoman
minimization: yeoman
uglify: yeoman
cndify: yeoman
lint: yeoman
compile: yeoman
test: yeoman
compression: nginx
expire headers: nginx



scale images

  change width - maintain aspect ratio
  sips --resampleWidth 100 backup-images/*.jpg



set expiration headers

  nginx config - place within server block

      location ~* \.(js|css|png|jpg|jpeg|gif|ico)$ {
        expires 1y;
        log_not_found off;
      }

  NOTE: you can set expire-headers on external rest api


enable compression

  nginx config - place in global section at top


  gzip  on;
  gzip_http_version 1.1;
  gzip_vary on;
  gzip_comp_level 6;
  gzip_proxied any;
  gzip_types text/plain text/html text/css application/json application/javascript application/x-javascript text/javascript text/xml application/xml application/rss+xml application/atom+xml application/rdf+xml;



  Confirm compression

  curl  http://ufc.mbp --silent -H "Accept-Encoding: gzip,deflate" --write-out "%{size_download}\n" --output /dev/null
  905

  curl  http://ufc.mbp --silent  --write-out "%{size_download}\n" --output /dev/null
  2021






XXX


