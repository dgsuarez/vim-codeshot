Codeshot
========

Easily take "screenshots" of your code in vim.

Requirements
------------

The actual `code -> image` transformation is done with [pygments], so you need
to have it installed.

The plugin also requires `xclip`, so it's not going to work on Mac.

Usage
-----

Check out this small demo:

![Demo gif]

`:Codeshot` will put an image with your code in the system clipboard that you
can paste wherever you need.

The command uses ranges, so you can select some text to and invoke it to take a
partial shot, or in general use any range (`:%Codeshot` is the default when no
selection is available).

Options
-------

You can control the appearance of the code using the following options:

-   `g:CodeshotStyle`: Pygments style (i.e. Color scheme). Check the [Pygments
    demo] for a list of available styles. (default `trac`)
-   `g:CodeshotFontSize`: Font size. (default `32`)
-   `g:CodeshotShowLineNumbers`: Show line numbers. (default `0` for no line
    numbers, 1 will show them)

  [pygments]: http://pygments.org/
  [Demo gif]: codeshot.gif?raw=true
  [Pygments demo]: http://pygments.org/demo/
