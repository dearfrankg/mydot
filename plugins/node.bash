


#----------------------------------------------------------------------------
# NODE
#----------------------------------------------------------------------------

    # How to update the verions in a package file:


        # 1) npm outdated
        # 2) change the version of any outdated module to '*'
        # npm update --save or --save-dev



        # Simply change every dependency's version to *, then run npm update --save.

        # Before:

        #   "dependencies": {
        #     "express": "*",
        #     "mongodb": "*",
        #     "underscore": "*",
        #     "rjs": "*",
        #     "jade": "*",
        #     "async": "*"
        #   }


        # After:

        #   "dependencies": {
        #     "express": "~3.2.0",
        #     "mongodb": "~1.2.14",
        #     "underscore": "~1.4.4",
        #     "rjs": "~2.10.0",
        #     "jade": "~0.29.0",
        #     "async": "~0.2.7"
        #   }
