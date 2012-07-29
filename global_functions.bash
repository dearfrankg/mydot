#!/bin/sh

#######################################
# functions for my bash environment
#######################################



if [ "$DEBUG" = "1" ]; then
    echo "loading global functions"
fi

github_repo_exists() {              # Check if github repo exists
    curl -s http://github.com/api/v2/json/repos/show/dearfrankg/$(echo -n $1) | \
    perl -MJSON  -E ' $hashref = decode_json(do{local$/;<>});  say $hashref->{repository}{name} if (exists $hashref->{repository}{name});  '
}

gp() {                              # Create git project directory and first commit with .gitignore

    PROJECT="$1"

    echo "Please select from the following options"
    choice1="Create a github & local repo"
    choice2="Create only a local repo"
    choice3="Abort"
    select yn in "$choice1" "$choice2" "$choice3" ; do
        case $yn in
            "$choice1" ) repo="github"; echo "Creating a github & local repo"; break;;
            "$choice2" ) repo="local"; echo "Creating only a local repo"; break;;
            "$choice3" ) return 0;
        esac
    done

    ##############################################
    ## VALIDATE THAT REPO DOESN"T ALREADY EXIST
    ##############################################

    if [ "$repo" = "github" ]; then
        ##
        ## Bail if repo exists at github
        ##
        ANSWER=$( github_repo_exists $PROJECT )
        if [ "$ANSWER" = "$PROJECT" ]; then
            echo "$PROJECT github repo already exists"
            return 0
        fi
    fi

    ##
    ## Bail if repo exists in current working directory
    ##
    if [ -d "$PROJECT" ]; then
        echo "Project ./$PROJECT directory already exists."
        return 0
    fi

    ##############################################
    ## CREATE REPO
    ##############################################

    ##
    ## Create local repo
    ##
    mkdir $PROJECT
    cd $PROJECT
    touch README.md
    echo "log tmp .DS_Store " | tr " " "\n" > .gitignore
    git init
    git add .
    git commit -m "first commit"

    if [ "$repo" = "github" ]; then

        ##
        ## Create remote repo at github
        ##
        curl -F 'login=dearfrankg' -F 'token=b776ffff21c8e7b29869eb7bce3f3575' \
            https://github.com/api/v2/json/repos/create -F "name=$PROJECT"

        ##
        ## Add remote information and push to github
        ##
        git remote add origin "git@github.com:dearfrankg/$PROJECT.git"
        git push origin master

    fi

    return 1;   # return success code
}






#==============
# general
#==============

finder() { 
    if [[ "$1" ]]; then 
        open -a finder $1
    else 
        open -a finder $(pwd)
    fi

}



col() {
    echo -e "\033[1;31m$1\033[m"
}



path() {                            # show path env data in a nice format
    perl -E ' $data = $ARGV[0]; $data =~ s/:/\n/g; say $data; ' $(echo $PATH)
}

setcat() {                          # catalyst shortcuts via env vars
    myapp=$(basename $(pwd))
            m="./lib/$myapp/Model"
            v="./lib/$myapp/View"
            c="./lib/$myapp/Controller"
       create="./script/${myapp}_create.pl"
           go="./script/${myapp}_server.pl -r"
}

functions() {                       # ls my bash functions
    perl -nE ' print  if /^\w+\s*\(/;  ' $HOME/.bash_custom/global_functions.bash
}

otree() {                            # tree output in color
    /usr/local/bin/tree -C $@ | less -R
}

showdir() {                         # navigate to a directory and show its contents
    cd
    if [ "$1" != "" -a "$2" != "" ]
    then
        DIR="$1/$2*"
        cd $DIR
    elif [ "$1" != "" ]
    then
        DIR="$1*"
        cd $DIR
    fi
    ll
}



#==============
# perl
#==============

pv() {                              # show perl version for a module ex: pv CGI
    perl -e "use $1 9999;"  2>&1 \
    | perl -ne ' ($a) = /(version [\d.]+) at/;  print "$a\n" if $a; '
}


#==============
# git
#==============

git_parse_branch() {                # find the git branch if in this directory
  # git_parse_branch conflicts with App::cpanminus
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

git_add_file() {                    # easily commit file - git af /path/to/file 'commit message'
    echo "git_add_file /path/to/file 'commit message' # (personal bash function) "
    [[ $# -ne 2 ]] && { echo "This command requires 2 parameters"; return 1; }
    [[ $(git log "$1") = "" ]] && { echo "file not tracked '$1'"; return 1; }
    git add "$1" && git commit -m "$2"
}

show_tags() {                       # show tag, submitter, date
    for i in $(git tag | sort -r )
    do
        show_tag $i
    done
}

show_tag() {                        # show tag, submitter, date
    [[ -z "$1" ]] && { echo "missing tag parameter"; return 1; }
    FOUND=0
    for i in $(git tag)
    do
        [[ "$i" == "$1" ]] && { FOUND=1; break; }
    done
    [[ "$FOUND" -eq 0 ]] && { echo "tag not found"; return 1; }

    git show $1 \
    | head -3 \
    | perl -e ' while (<>) { chomp; s/^\w+:?\s*//; push @me, $_; } printf("%-10s %-50s %-40s\n", @me); '
    return 0
}

git_clone() {                       # clone remote git repo and cd into the directory
    url=$1
    regex='.*\/(.*)\.git$'
    if [[ $1 =~ $regex ]]; then
        dir="${BASH_REMATCH[1]}"
        echo "cloning: $dir"
        git clone -q $url
        cd $dir
        ll
    else
        echo "Cannot determine directory name"
    fi
}


