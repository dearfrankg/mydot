

# AngularJS

echo <<'end' > /dev/null
Everything you need assiciated with AngularJS
end



angular() {
  echo <<"end" 

Creating an angular project 
-----------------------------------

### make proj dir
-----------------------------------

    cd ProjectName


### create project template files
-----------------------------------

    yo angular --coffee [--minsafe]


### configure bower to install dependencies
-----------------------------------

    update bower.json 
    bower install


### configure for testing
-----------------------------------

    app/index.html 

        <!-- build:js(.tmp) scripts/scripts.js -->
                    --------

    Gruntfile.js

        grunt.registerTask('server', [
          'clean:server',
          'coffee',
          ------------

    karma.conf.js

        files = [
          JASMINE,
          JASMINE_ADAPTER,
          'app/components/jquery/jquery.js',
          'app/components/jquery-ui/ui/jquery-ui.js',
          
          'app/components/angular-all-unstable/angular.js',
          'app/components/angular-all-unstable/angular-resource.js',
          'app/components/angular-all-unstable/angular-mocks.js',

          'app/components/underscore/underscore.js',
          ... all angular dependencies angular-ui, etc

          '.tmp/scripts/*.js',
          '.tmp/scripts/**/*.js',
          '.tmp/spec/**/*.js'
        ];

        ...
        ...
        ...

        browsers = ['PhantomJS'];




### start web server 
-----------------------------------

    aserver
    # grunt server


### start karma 
-----------------------------------

    atest
    # karma start --auto-watch



end

}




# AngularJS COMMAND ALIASES 

alias aserver='grunt server'
alias atest='karma start --auto-watch'




