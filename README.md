usyd-beamer-theme
=================

This is an unofficial version of the University of Sydney presentation template
for use with beamer. It generally keeps to the intent of the official
presentation, however the most noticeable difference is the fonts.

The template has been tested in both the 4:3 and 16:9 aspect ratios, and should
work in any other.

The latest examples can be downloaded from the [releases page][releases] or directly from the links
below.

- [Main theme][example.pdf]
- [Logobar theme][example-logobar.pdf]
- [Poster theme][poster.pdf]

How to use
----------

To add this theme to your presentation (assuming you are using git to version
control it as well), from the root directory you can add the repository as a
submodule

    git submodule add https://github.com/malramsay64/usyd-beamer-theme.git

To incorporate that directory into the path LaTeX searches add the following
before the `\usetheme` directive

    \makeatletter
    \def\input@path{{usyd-beamer-theme/}}
    \makeatother

Then include the following after the `\usetheme` directive.


    \graphicspath{{usyd-beamer-theme/}}

This adds the path of the image to the path to look for files.

Then using the theme is then as simple as adding the theme

    \mode<presentation>
    {%
        \usetheme{usyd}
    }

Customisation
-------------

The image in the titlegraphic is customisable using the
`\titlegraphic{<filename>}` command, where `<filename>` is the filename of the
image you want to use. The width of the image will always be half the slide
width. To prevent any issues with the image not filling the vertical height of
the slide there is a `\titlegraphicbackground{<colour>}` command which will
change the colour of the background to whichever colour you want, where
`<colour>` is a colour defined using the `\color{}` command. The default colour
is white.

An additional logo can be added to the titlepage next to the USYD logo with the
`\affiliationlogo{<filename>}` command.

Removing the footline can be done by adding the following code snippet to your
document.

    \setbeamertemplate{footline}{}


### Logobar Theme

A variation on the theme which includes navigation elements in a bar
at the top of each slide. This optional variation on the theme is enabled
by passing the `logobar` option when specifying the theme.

    \usetheme[logobar]{usyd}

You can see this theme in action in the [example-logobar.pdf][] file.

To get the dots in the logobar as displayed in the example images, you either
need to create subsections

    \section{Introduction}
    \subsection{An Introduction subsection}

Or alternatively, you can increment the subsection counter

    \section{Introduction}
    \stepcounter{subsection}

This second approach is particularly useful for shorter presentations where
subsections don't make sense.

This theme variation was contributed by [Joel Nothman](https://github.com/jnothman).

Poster
------

There is also support for a [poster][poster.pdf] using the beamerposter package with `\usetheme{usyd-poster}`.

Contributors
------------

Thanks to these people for their contributions

- [finnconor](https://github.com/finnconor)
- [Joel Nothman](https://github.com/jnothman)
- [Stephany Berrio](https://github.com/chinitaberrio)

[releases]: https://github.com/malramsay64/usyd-beamer-theme/releases/latest
[example.pdf]: https://github.com/malramsay64/usyd-beamer-theme/releases/download/v0.1.1/example.pdf
[example-logobar.pdf]: https://github.com/malramsay64/usyd-beamer-theme/releases/download/v0.1.1/example-logobar.pdf
[poster.pdf]: https://github.com/malramsay64/usyd-beamer-theme/releases/download/v0.1.1/poster.pdf
