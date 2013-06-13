
# Working with .dmg image files
#
echo <<'end' > /dev/null

Make writeable
hdiutil convert nameoffile.dmg -format UDRW -o nameoffile_writable.dmg

get size
hdiutil resize -limits nameoffile_writable.dmg

resize
hdiutil resize -sectors 999999 nameoffile_writable.dmg

mount
hdiutil attach nameoffile_writable.dmg




end



