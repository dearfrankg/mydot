##-------------------------
## POW
## serves apps at app.dev using links at ~/.pow
##-------------------------

##---------------------------------------------------
## Setup all projects represented in the pow directories
## ~/.pow and ~/.pow/apps
## an alias is created that will open the dir and the web page
##---------------------------------------------------
    setup_projects() {
        for f in ~/.pow/* ~/.pow/apps/*
        do
            [ -L $f ] || continue   # skip unless symlink
            local name=${f##*/}
            local path=$(readlink $f)
            unalias $name > /dev/null 2>&1
            alias $name="promptweb http://$name.dev no; cd $path && ll"
        done
    }
    setup_projects

    start_apps() {
        for f in ~/.pow/apps/*
        do
            [ -L $f ] || continue   # skip unless symlink
            local name=${f##*/}
            local path=$(readlink $f)
            local server="$path/$name-server"
            echo "starting $server ..."
        done

    }








