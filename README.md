### highlight-line

----

*highlight-line* is a super small vim plugin that allows you to
highlight lines in vi. In contrast to visual mode selection, the
highlight stays active even when the cursor moves. This makes
it easier to keep track of important lines that you want to keep
focus on.


### Installation

----

*highlight-line* is structured according to vim's plugin specifications
and can be consumed by vim's native package manager as well as by several
other tools like *Vundle* or *Pathogen*.

If you use vim's native package manager, just clone the repository in
either the `start` or `opt` folder of your vim configuration folder:

```console
[user@host ~]$ cd ~/.vim/pack/plugins/start/
[user@host ~/.vim/pack/plugins/start/]$ git clone https://github.com/qtc-de/vve
```

If you have chosen the `start` folder, *highlight-line* will be available on
each startup of vim. If you decided to use the `opt` folder, you have to call
`:packadd highlight-line` from within vi to enable it.

If you use an external package manager please read the corresponding manual
on how to add additional plugins.


### Usage

----

*highlight-line* defines key mappings with identical functionality for normal
and visual mode. While the visual mode mappings operate on the data that has been
selected, the normal mode mappings always operate on the current line.

The following mappings are currently defined (notice that each key combination needs
to be prefixed by your `<leader>` key):


**Normal Mode Mappings**

| Key       |Description                                                  |
|:---------:|-------------------------------------------------------------|
| hh        | Highlight the current line in dark grey                     |
| hr        | Highlight the current line in dark red                      |
| hy        | Highlight the current line in dark yellow                   |
| hg        | Highlight the current line in dark green                    |
| hb        | Highlight the current line in dark blue                     |
| H         | Remove highlighting from the current line                   |
| hc        | Remove highlighting everywhere                              |


**Visual Mode Mappings**

| Key       |Description                                                  |
|:---------:|-------------------------------------------------------------|
| hh        | Highlight the selected line(s) in dark grey                 |
| hr        | Highlight the selected line(s) in dark red                  |
| hy        | Highlight the selected line(s) in dark yellow               |
| hg        | Highlight the selected line(s) in dark green                |
| hb        | Highlight the selected line(s) in dark blue                 |
| H         | Remove highlighting from the selected line(s)               |
| hc        | Remove highlighting from the selected line(s)               |


### Acknowledgments

----


The implementation is basically the same as suggested by [Colin Bartlett](https://vimtricks.com/p/author/cbartlett/)
in his vimtricks article [Highlight specific lines](https://vimtricks.com/p/highlight-specific-lines/).
