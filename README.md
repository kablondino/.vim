# Vim files
This repository tracks and applies the different plugins and custom files for my configuration.
These include the color scheme `swagdino.vim` and behavior in Python and TeX files, such as tab autoindent, etc.
More of these may be added in the future.

Plugins are managed as git submodules, and they are stored in `./pack/all_plugins/start/` and `./pack/all_plugins/opt/`, in which the ones in `start` load automatically.
Any plugins in `opt` need the `:packadd` command invoked in a vim session.

## Install
Only one step must be invoked to install this: linking the `.vimrc` file to the home directory.
```
ln -s .vimrc ~/.vimrc
```

## External link
A good guide for how these work can be found at this [link](https://begriffs.com/posts/2019-07-19-history-use-vim.html?hn=3) in the "Third-party plugins".
This is also a good article on Vim, in general.

