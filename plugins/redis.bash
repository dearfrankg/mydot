
# REDIS

<<XXX


frankg@mbp:dmo (master)$brew install redis
==> Downloading http://redis.googlecode.com/files/redis-2.6.13.tar.gz
######################################################################## 100.0%
==> make -C /private/tmp/redis-Jh3w/redis-2.6.13/src CC=cc
==> Caveats
To have launchd start redis at login:
    ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
Then to load redis now:
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
Or, if you don't want/need launchctl, you can just run:
    redis-server /usr/local/etc/redis.conf
==> Summary
🍺  /usr/local/Cellar/redis/2.6.13: 9 files, 752K, built in 15 seconds

XXX

alias start_redis=' redis-server /usr/local/etc/redis.conf '
