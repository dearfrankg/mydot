
##---------------------------------------------------
## NOTES
## an app to view my markup docs hosted locally
##---------------------------------------------------


    # # setup env var
    # export pages="$proj/Sites/notes/pages"

    # # open folder and site
    # alias notes=" promptweb http://notes.dev no; cd $pages; tree "
    # alias pages=" cd $pages; tree "

    # # function to edit doc using a partial name
    # nedit() {
    #     file=`find $pages -type f | grep $1 | head -1 `
    #     if [[ -f "$file" ]]; then
    #         vi $file
    #     else
    #         cmd="use Frank::Nedit qw(:all); create_contentious_note();"
    #         vi $( perl -e "$cmd" $1 )
    #     fi
    # }

