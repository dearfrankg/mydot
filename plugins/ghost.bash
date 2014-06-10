

  # GHOST BLOG SOFTWARE



  # THEME INSTALL 
  # ------------------------------------

  #   THEME NAME: Swayze
  #   WEB: http://www.allaboutghost.com/top-10-free-ghost-themes-december-2013/


  #   ADDING SYNTAX HIGHLIGHT
  #   WEB: http://blog.peterschmalfeldt.com/adding-syntax-highlighting-to-ghost/

  #   NOTE: could not get edit view working


  #   PART1 - Add script tag

  #       File:

  #         ./content/themes/default.hbs

  #       Add just before ending body tag

  #         <script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>


  #   PART2 - Adjust the font size

  #       File: ./css/style.css

  #       Augment Section

  #       /* Normalize monospace sizing: en.wikipedia.org/wiki/MediaWiki_talk:Common.css/Archive_11#Teletype_style_fix_for_Chrome */
  #       pre,
  #       code,
  #       kbd,
  #       samp {
  #         font-family: monospace, 'Open Sans', sans-serif;
  #         font-size: 80%;
  #         background-color: lavender;
  #         border-radius: 5px;
  #       }

  #       pre {
  #         border: 1px solid gray;
  #       }

  #       li.L1, li.L3, li.L5, li.L7, li.L9 {
  #         background: none;
  #       }


  #   PART3 - Adjust article width

  #       File: ./css/style.css

  #       Augment Sections

  #       .articles

  #       .single-article

  #         width: 800px;

