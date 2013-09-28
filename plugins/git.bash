########################################################################
#
# git related functions
#
########################################################################

#=======================================================
# Git Related Aliases
#=======================================================
alias git="hub"         # hub tool
alias gl='git lg'
alias ghr="gh_repos"

alias git-reword-first='echo "git checkout FIRST_COMMIT_SHA && git commit --amend && git rebase HEAD master" '

#=======================================================
# github cli
#=======================================================

gh_curl="curl -s -u dearfrankg:frankg "
gh_url=" https://api.github.com/users/dearfrankg/repos "
gh_repos() {
  cmd=" $gh_curl $gh_url "
  data=$($cmd | json -a name updated_at )
  local odd=1
  clear
  printf "%-40s %s\n----------------------------------------------------------------------\n" "REPO" "LAST UPDATED"
  for l in $data
  do
    if [[ "$odd" == "1" ]]; then
      odd=0
      name=$l
    else
      odd=1
      date=$l
      fdate=$(humanizeDuration $date)
      printf "%-40s %s\n" "$name" "$fdate"
    fi
  done

}



#-------------------------------------------------------------------------
# Save repo changes
#-------------------------------------------------------------------------
save_repo_changes() {

  ## Set $dir to pwd or $1 param
  ##
  local dir=$(pwd)
  [ $1 ] && dir=$1

  ## Validate $dir is a repo dir
  ##
  [ ! -d "$dir/.git" ] &&
      echo "$dir is not a repo dir" &&
      return

  ## if we have repo changes display the repo changes and
  ## prompt for a commit message
  ##
  local cmd="git --git-dir $dir/.git --work-tree $dir status -s"
  local changes=$( $cmd )
  RESPONSE=""
  [ "$changes" ] &&
      echo "CHANGES:" &&
      echo "$changes" &&
      prompt "Enter a message to commit to repo $dir"

  ### If they provide a commit message then
  ### commit all changes with the commit message
  ### all changes include new files and deleted files
  ###
  [ "$RESPONSE" ] &&
      git --git-dir $dir/.git --work-tree $dir add -A . &&
      git --git-dir $dir/.git --work-tree $dir commit -m "$RESPONSE"

}


#-------------------------------------------------------------------------
# Check if github repo exists
#-------------------------------------------------------------------------
github_repo_exists() {
    curl -s http://github.com/api/v2/json/repos/show/dearfrankg/$(echo -n $1) | \
    perl -MJSON  -E ' $hashref = decode_json(do{local$/;<>});  say $hashref->{repository}{name} if (exists $hashref->{repository}{name});  '
}

#-------------------------------------------------------------------------
# Find the git branch if in this dir
#-------------------------------------------------------------------------
git_parse_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

git_dirty() {
  git rev-parse --is-inside-work-tree &>/dev/null || return
  [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && echo "*" || echo ""
}


#-------------------------------------------------------------------------
# easily commit file - git af /path/to/file 'commit message'
#-------------------------------------------------------------------------
git_add_file() {
    echo "git_add_file /path/to/file 'commit message' # (personal bash function) "
    [[ $# -ne 2 ]] && { echo "This command requires 2 parameters"; return 1; }
    [[ $(git log "$1") = "" ]] && { echo "file not tracked '$1'"; return 1; }
    git add "$1" && git commit -m "$2"
}

#-------------------------------------------------------------------------
# show tag, submitter, date
#-------------------------------------------------------------------------
show_tags() {
    for i in $(git tag | sort -r )
    do
        show_tag $i
    done
}

#-------------------------------------------------------------------------
# show tag, submitter, date
#-------------------------------------------------------------------------
show_tag() {
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

#-------------------------------------------------------------------------
# seed angular project
#-------------------------------------------------------------------------
ang_seed() {
  local proj=$1
  [[ ! "$proj" ]] && echo "need the name of the seed project" && return
  git clone -q "$review/angular-seed" "$proj"
  cd $proj
  ll
}

#-------------------------------------------------------------------------
# clone remote git repo and cd into the directory
#-------------------------------------------------------------------------
git_clone() {
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


#-------------------------------------------------------------------------
# Create git project directory and first commit with .gitignore
#-------------------------------------------------------------------------
gp() {

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



