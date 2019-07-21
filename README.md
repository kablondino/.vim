# Vim files
This repository tracks and applies the different plugins and custom files for my configuration.
These include the color scheme `swagdino.vim` and behavior in Python and TeX files, such as tab autoindent, etc.
More of these may be added in the future.

Plugins are managed as git submodules, and they are stored in `./pack/all_plugins/start/` and `./pack/all_plugins/opt/`, in which the ones in `start` load automatically.
Any plugins in `opt` need the `:packadd` command invoked in a vim session.


## Install
Installation takes only a few easy steps.
First, clone this repository into your home directory.
```
git clone https://github.com/kablondino/.vim.git
```
Next, be sure to load the submodules (the plugins themselves).
```
git submodule init
git submodule update
```
As the final step, link the `.vimrc` file to the home directory.
```
ln -s .vimrc ~/.vimrc
```
Note that some distributions (or something unknown to me) won't properly read symbolic links for the configuration file.
This means you could either make a hard link, by running the above command without the `-s` option, or simply copy the `.vimrc` file.

Be aware, one other piece of software will be necessary for the proper display of characters.
[Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) is used extensively by the lightline and lightline-bufferline plugins.
Be sure to install one of the fonts of your choice from their selection.


## External link
A good guide for how these work can be found at this [link](https://begriffs.com/posts/2019-07-19-history-use-vim.html?hn=3) in the "Third-party plugins".
This is also a good article on Vim, in general.

