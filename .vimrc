"  ███████╗██╗    ██╗ █████╗  ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗ 
"  ██╔════╝██║    ██║██╔══██╗██╔════╝ ██╔══██╗██║████╗  ██║██╔═══██╗
"  ███████╗██║ █╗ ██║███████║██║  ███╗██║  ██║██║██╔██╗ ██║██║   ██║
"  ╚════██║██║███╗██║██╔══██║██║   ██║██║  ██║██║██║╚██╗██║██║   ██║
"  ███████║╚███╔███╔╝██║  ██║╚██████╔╝██████╔╝██║██║ ╚████║╚██████╔╝
"  ╚══════╝ ╚══╝╚══╝ ╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ 
"                                                                   
"  ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗                          
"  ██║   ██║██║████╗ ████║██╔══██╗██╔════╝                          
"  ██║   ██║██║██╔████╔██║██████╔╝██║                               
"  ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║                               
"   ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗                          
"    ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝                          


" ------------------------- Core ---------------------------------------------
set nocompatible  " Forces VIM, and not vi
filetype plugin indent on

"  FOR SECURITY, disable modelines
set modelines=0 nomodeline

" Backspace by default does NOT delete already-written text.
" backspace=2 changes this to a more-default manner
set backspace=1
set tabstop=4 shiftwidth=4  " Tab control

set mouse=nv  " Mouse is usable only in Normal and Visual mode

set encoding=utf-8 fileencoding=utf-8
set t_ZH=[3m t_ZR=[23m


" ------------------------- Visual Things ------------------------------------
set hidden  " Allows buffer switching without saving
set showtabline=2 laststatus=2  " Always show tabs and last status
set colorcolumn=80  " Set the cursorline and cursorcolumn
set lazyredraw ttyfast showcmd showfulltag
set regexpengine=1
set showmatch  " Show matching parenthesis, etc.
set incsearch ignorecase smartcase  " Searching things

set bg=dark
colorscheme swagdino

" Better way of showing syntax
if !exists("g:syntax_on")
	syntax enable
endif

" Line number configurations
set number
" Set numbers on losing and gaining window focus
autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber

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


" ----------------------------------------------------------------------------
"  Status Line Configuration with Lightline and Lightline-Buffer
" ----------------------------------------------------------------------------
source $HOME/.vim/lightline.vimrc


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

" Turn off line cursor and turn on spell check, linebreak for markdown
autocmd BufEnter,BufNewFile,BufRead *.md,*.MD setlocal spell spelllang=en
			\ linebreak nocursorline nocursorcolumn

" ========================= WORK SETTINGS ====================================
au BufRead,BufNewFile,BufEnter ~/VCP/*.sh setlocal tabstop=2 shiftwidth=2 expandtab

