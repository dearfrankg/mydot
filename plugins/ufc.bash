echo <<'www' > /dev/null
#----------------------------------------------
# UFC PROJECT NOTES
#----------------------------------------------

A place to track progress of the UFC project.




1) BACK-END
#################################

  STATUS:
  x mongodb database server
  x node rest server


    Mongodb
    Use mongodbctl.

    Rest API
    After trying many libs and conversations I've concluded that writing your
    own rest API is the only way to fly for the following reasons:

    - It's simple once you know how.
    - The existing rest-api modules suck in one way or another
    - Your rest api is like your model it will change and evolve from app to app.



    TALKING TO THE REST API
    ------------------------

    ANGULAR

        use $resource
        # see reference section below


    JAVASCRIPT:

        use superagent

        # insert record
        ufc.post '/events', fightEvent


    CURL:

        -s  silent the progress bars
        -I  show res header 
        -H  send req header   -H "Accept: application/json"
        -v  verbose - like trace

        note: use quotes to avoid the & being caught by the shell -- curl 'localhost?a=1&b=2'

        json  pipe to json to make pretty     curl ... | json



    REFERENCES
    - angular $resource (http://goo.gl/FUXKY)
    - node modules page (http://goo.gl/pUrx9)
    - mongo search page (http://goo.gl/hr0Yq)
    - superagent allows simple http use (http://goo.gl/jOdu4)
    - example home grown rest api (http://goo.gl/KIGDe)
    - example angular resource usage (http://goo.gl/5MFRz)







2) SCRIPT: SCRAPE-MMA-VS
#################################
  STATUS:
  _ scrape-mma-vs





3) USER INTERFACE
#################################
  STATUS:
  x Select page
  _ Play video


    Layout

    After playing with layout for a while I decided to go with a useful layout that
    will let me add fights to a playlist.

      - proof of concept here: ( http://goo.gl/XEVQW )


    Fading Selector Effect

      - check out the effect when you disable an extension in chrome.


    Scenario
    --------

    Select Fights

      - add and delete by clicking on fight in fight list

      - play or remove fights by clicking on icons in playlist

      - play playlist by clicking icon in playlist


    Play fight videos

      - go into play-mode by clicking icon in playlist

      - IDEAL: play-mode dims and plays playlist automatically

      - custom controls on video if possible

      - escape key takes you back to select-mode


    NOTE: If you cannot go ideal then tabs for each video in play-mode screen
















































www





