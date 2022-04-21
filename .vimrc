"  ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"  ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"  ██║   ██║██║██╔████╔██║██████╔╝██║
"  ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"   ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"    ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝


" ------------------------- Core ---------------------------------------------
set nocompatible  " Forces VIM, and not vi
filetype plugin indent on

" FOR SECURITY, disable modelines
set modelines=0 nomodeline

" Backspace by default does NOT delete already-written text.
" backspace=2 changes this to a more-default manner
set backspace=1
set tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab  " Tab control
set timeoutlen=50 ttimeoutlen=0  " Nearly no mapping/key code delays
set scrolloff=4

set mouse=nv  " Mouse is usable only in Normal and Visual mode

set encoding=utf-8 fileencoding=utf-8
set t_ZH=[3m t_ZR=[23m

" Wildmenu, wrapped in 'if' for compatibility
if has("wildmenu")
	set wildignore+=*.swp
	set wildmenu
	set wildmode=full
endif


" ------------------------- Visual Things ------------------------------------
" Choose one!
let line_choice = "lightline"  " Else vim-crystalline

if line_choice == "lightline"
	packadd! lightline.vim
	packadd! lightline-bufferline
	source $HOME/.vim/lightline.vimrc
else  " Defaults to vim-crystalline
	packadd! vim-crystalline
	source $HOME/.vim/crystalline.vimrc
endif

set hidden  " Allows buffer switching without saving
set showtabline=2 laststatus=2  " Always show tabs and last status
set noshowmode  " Removes duplicate info on the command line
set colorcolumn=80  " Set the cursorline and cursorcolumn
set lazyredraw ttyfast showcmd showfulltag
set regexpengine=1
set showmatch  " Show matching parenthesis, etc.
set incsearch ignorecase smartcase  " Searching things
set foldenable foldmethod=manual

set bg=dark
colorscheme swagdino

" Better way of showing syntax
if !exists("g:syntax_on")
	syntax enable
endif

" Line number configurations
set number
" Set numbers on losing and gaining window focus
"autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber

" Sets list characters (\t, \n, etc.)
set list
let &showbreak = " \u21B3 "
if has('multi_byte') && &encoding ==# 'utf-8'
	let &listchars = "tab:\uE621\u00B7,trail:\u00B7,eol:\u00AC,extends:\uE0C6,precedes:\uE0C7,nbsp:\u00B1"
else
	let &listchars = 'tab:> ,trail:.,eol:|,extends:>,precedes:<,nbsp%'
endif
" · (The middle dot) U+00B7
" ¬ (The not symbol) U+00AC
" ↪ U+21AA, ↳ U+21B3


" ------------------------- Alias and such -----------------------------------
source $HOME/.vim/alias.vimrc


" ------------------------- Signify ------------------------------------------
let g:signify_vcs_list = [ 'git' ]  " Look only for git

let g:signify_realtime = 1
let g:signify_cursorhold_insert = 0
let g:signify_cursorhold_normal = 0

" let g:signify_sign_add = '烙'
let g:signify_sign_change = '~'
hi SignifySignAdd ctermfg=2
hi SignifySignDelete ctermfg=1
hi SignifySignChange ctermfg=3


" ------------------------- File Type Specification --------------------------
" Syntax for odd file types
autocmd BufNewFile,BufRead *.sage,*.spyx,*.pyx set filetype=python
autocmd BufNewFile,BufRead *.feature setlocal expandtab
autocmd BufNewFile,BufRead *.rasi set filetype=css
autocmd BufNewFile,BufRead Jenkinsfile* set filetype=groovy

" Turn off line cursor and turn on spell check, linebreak for markdown
autocmd BufEnter,BufNewFile,BufRead *.md,*.MD setlocal spell spelllang=en
			\ linebreak nocursorline nocursorcolumn colorcolumn=80,100
			\ textwidth=99
let g:vim_markdown_folding_level = 6
let g:vim_markdown_folding_style_pythonic = 1

" Vieb config file
autocmd BufEnter,BufNewFile,BufRead viebrc setlocal syn=vim

" Julia loading
autocmd BufReadPre,BufFilePre *.jl :packadd julia-vim && set syn=julia

" Jinja loading
autocmd BufReadPre,BufFilePre *.jinja :packadd Vim-Jinja2-Syntax
