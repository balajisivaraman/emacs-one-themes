# One for Emacs

One for Emacs is an Emacs port of the [One theme for
Vim/Neovim](https://github.com/rakr/vim-one/). It provides both the
Dark and Light variants. (Note that the Vim theme itself was a port of
[One Dark](https://atom.io/themes/one-dark-syntax) and [One
Light](https://atom.io/themes/one-light-syntax) syntax themes for the
Atom editor.)

One for Emacs is tested only under Emacs 24 or greater, but should be
working under Emacs 23 as well. The theme is implemented in terms of
customizations and `deftheme` and does not require the
`color-theme-package`.

# Supported Modes

- Helm
- Magit
- Org
- Dired
- Flycheck
- EDiff
- Company
- Rainbow Delimiters
- Spaceline
- Ledger

And more.

# Manual Installation

Clone this repository to some location on your PC.

```
(add-to-list 'load-path "<clone location>/emacs-one-themes")
(add-to-list 'custom-theme-load-path "<clone location>/emacs-one-themes")
```

```
(load-theme 'one-dark t)
```
OR
```
(load-theme 'one-light t)
```

# Contributing

This port is very much a work-in-progress. I'm not a visual designer
and have eyeballed colouring of the various faces based on the
original Vim theme, as well as what looks pleasing to me. If you feel
some colours could be improved, I'd happily accept PRs for the same.

If you find modes that are missing colour configurations, please feel
free to contribute the same using PRs. This theme is heavily biased
towards modes I use all the time.

# License

This theme is licensed under the GNU Public License Version 3.0. For
more info, please see the LICENSE file.

# Credits

This theme draws heavily upon the colours and naming specified in [Vim
One](https://github.com/rakr/vim-one/) by [Ramir
Akremi](https://github.com/rakr/).

Additionally, the design of this Emacs port is inspired by [Bozhidar
Batsov's](https://github.com/bbatsov)
[Solarized](https://github.com/bbatsov/solarized-emacs) and [Steve
Purcell's](https://github.com/purcell/color-theme-sanityinc-tomorrow)
[Tomorrow](https://github.com/purcell/color-theme-sanityinc-tomorrow)
themes.
