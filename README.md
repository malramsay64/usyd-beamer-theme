usyd-beamer-template
====================

This is an unofficial version of the University of Sydney presentation template
for use with beamer. It generally keeps to the intent of the official
presentation, however the most noticeable difference is the fonts.

The template has been tested in both the 4:3 and 16:9 aspect ratios, and should
work in any other.

Customisation
-------------

The image in the titlegraphic is customisable using the
`\titlegraphic{<filename>}` command, where `<filename>` is the filename of the
image you want to use. The width of the image will always be half the slide
width. To prevent any issues with the image not filling he vertical height of
the slide there is a `\titlegraphicbackground{<colour>}` command which will
change the colour of the background to whichever colour you want, where
`<colour>` is a colour defined using the `\color{}` command. The default colour
is white.


