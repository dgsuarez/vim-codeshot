Codeshot
========

Easily take "screenshots" of your code in vim.

Requirements
------------

The actual `code -> image` transformation and the copy to the clipboard are
done with [silicon], so you need to have it installed. It works on macOS and
Linux:

-   macOS: `brew install silicon`
-   Linux: your distro's package, or `cargo install silicon`

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

-   `g:CodeshotStyle`: Silicon theme (i.e. Color scheme). Run `silicon
    --list-themes` for a list of available themes. (default `Dracula`)
-   `g:CodeshotFont`: Font family. (default `Hack`)
-   `g:CodeshotFontSize`: Font size. (default `32`)
-   `g:CodeshotShowLineNumbers`: Show line numbers. (default `0` for no line
    numbers, `1` will show them, numbered as in the buffer)

  [silicon]: https://github.com/Aloxaf/silicon
  [Demo gif]: codeshot.gif?raw=true
