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


set nocompatible  " Forces VIM, and not vi
filetype plugin indent on

set showcmd
set showfulltag

" ----------------------------------------------------------------------------
"  FOR SECURITY, disable modelines
set modelines=0
set nomodeline
"-----------------------------------------------------------------------------

" COLORSCHEME SPECIFIC OPTIONS
set bg=dark
colorscheme swagdino

" Specific colors for paretheses and math operators; BREAKS LaTeX!
"autocmd BufRead,BufNewFile * syn match parens /[(){}\[\]]/ 
"			\| hi parens guifg=#ff0000 ctermfg=9
"autocmd BufRead,BufNewFile * syn match MyOperators /[\+\-\=\/]/ 
"			\| hi MyOperators guifg=#ffafff ctermfg=219


" ---------------------------------------------------------------------------
"  Status Line Configuration with Lightline and Lightline-Buffer
" ---------------------------------------------------------------------------
set noshowmode	" Removes duplicate info on the command line
let g:lightline = {
	\ 'colorscheme': 'deus',
	\ 'tabline': {
	\	'left': [ [ 'bufferinfo' ], [ 'buff_separator' ],
	\			[ 'buffers' ], ],
	\	'right': [ [ 'close' ], ],
	\ },
	\ 'tabline_separator': { 'left': "\uE0BC", 'right': "\uE0BA" },
	\ 'tabline_subseparator': { 'left': "\uE0BD", 'right': "\uE0BD"},
	\
	\ 'active': {
	\	'left': [ [ 'mode', 'paste', 'spell' ], [ 'readonly',
	\			'modified', 'filename' ], [ 'char_hex_value' ] ],
	\	'right': [ [ 'lineinfo' ], [ 'percent' ],
	\			[ 'fileencoding', 'filetype' ] ],
	\ },
	\
	\ 'inactive': {
	\	'left': [ [ 'big_separator' ], [ 'readonly', 'filename',
	\			'modified', 'char_hex_value' ] ],
	\	'right': [ [ 'lineinfo' ], [ 'percent' ],
	\			[ 'fileformat', 'fileencoding', 'filetype' ] ],
	\ },
	\
	\ 'component_expand': {
	\		'buffers': 'lightline#bufferline#buffers'
	\ },
	\ 'component_type': {
	\		'buffers': 'tabsel',
	\ },
	\
	\ 'component': {
	\		'char_hex_value': '0x%B',
	\		'filename': '%t',
	\		'lineinfo': "\uE0A1%3l|\uE0A3%-2v",
	\		'buff_separator': '',
	\		'big_separator': '      ',
	\ },
	\ 'component_function': {
	\		'filetype': 'MyFiletype',
	\		'fileformat': 'MyFileformat',
	\		'bufferinfo': 'lightline#buffer#bufferinfo',
	\		'readonly': 'LightlineReadonly',
	\		'modified': 'LightlineModified',
	\ }, }
function! MyFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . 
	\		WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
function! MyFileformat()
	return winwidth(0) > 70 ? (&fileformat . ' ' . 
	\		WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineReadonly()  " For the status line
	return &readonly ? "\uF023" : "\uF13E"  " Alternative:  U+E0A2
endfunction
function! LightlineModified()
	return &modifiable && &modified ? "\uE240 \uF00D" : "\uE240 \uF00C"
endfunction

let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#modified = "\uF040"
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#read_only = "\uF023"

let g:lightline#bufferline#number_map = {
\ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
\ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'}

let g:lightline.separator = { 'left': "\uE0B8", 'right': "\uE0BE" }  " U+E0B0 - E0C7
let g:lightline.subseparator = { 'left': "\uE0BF", 'right': "\uE0BF" }

" ------------------------- End Lightline ------------------------------------


" ------------------------- Alias and such -----------------------------------
" REMAP ARROW KEYS! to switch between buffers
nnoremap <Left> :bprev<return>
nnoremap <Right> :bnext<return>

" Delete buffer but NOT the split
cabbrev BD bn\|bd #

" ALIAS! Set W (capital w), and ẅ (w with diaeresis) to also write
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> ẅ ((getcmdtype() is# ':' && getcmdline() is# 'ẅ')?('w'):('ẅ'))
cnoreabbrev <expr> Ẅ ((getcmdtype() is# ':' && getcmdline() is# 'Ẅ')?('w'):('Ẅ'))


" Aliases for C, C++, and Fortran compiling, with no extra options sans -Wall
cabbrev C_compile !clear && gcc -Wall % -o %:r_c -lm
cabbrev Cpp_compile !clear && g++ -Wall % -o %:r_cpp -lm
cabbrev Fortran_compile !clear && gfortran -Wall % -o %:r_f
cabbrev matlab_run !clear && matlab -nodisplay -nojvm -nosplash -batch "run('%'); exit;"
cabbrev octave_run !clear && octave -qf "run('%');"


set hidden  " Allows buffer switching without saving
set showtabline=2 laststatus=2  " Always show tabs and last status

set lazyredraw ttyfast

" Tab control
set tabstop=4 shiftwidth=4
" Backspace by default does NOT delete already-written text.
" backspace=2 changes this to a more default manner
set backspace=1

" Set the cursorline and cursorcolumn
set cursorline colorcolumn=80

set showmatch  " Show matching parenthesis, etc.
set mouse=nv  " Mouse is usable only in Normal and Visual mode

" Better way of showing syntax
if !exists("g:syntax_on")
	syntax enable
endif

set encoding=utf-8 fileencoding=utf-8

set t_ZH=[3m t_ZR=[23m

" Searching things
set incsearch ignorecase smartcase
" Hit F3 to unhighlight searched term
nnoremap <silent><F3> :noh<return>

" Colorizer Toggle, REQUIRES Colorizer to be loaded!
nnoremap <silent><F4> :ColorToggle<return>


" Line number configurations
set number
" Set numbers on losing and gaining window focus
autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber


" Toggle RELATIVE line numbers on and off with Ctrl-L (upper or lower case)
function! g:NumberToggle()
	if &relativenumber == 0
		set relativenumber
	else
		set norelativenumber
	endif
endfunction
nnoremap <silent><C-L> :call g:NumberToggle()<return>

" Sets list characters (\t, \n, etc.)
set list
let &showbreak = " \u21B3 "
if has('multi_byte') && &encoding ==# 'utf-8'
	let &listchars = "tab:\u25B8\u00B7,trail:\u00B7,eol:\u00AC,extends:\uE0C6,precedes:\uE0C7,nbsp:\u00B1"
else
	let &listchars = 'tab:> ,trail:.,eol:|,extends:>,precedes:<,nbsp%'
endif
" UNICODE for symbols:
" ▶▷▸▹►▻ (The right small triangle) U+25B5 through U+25BB
" · (The middle dot) U+00B7
" ¬ (The not symbol) U+00AC
" ↪ U+21AA, ↳ U+21B3

" ------------------------- File Type Specifics ------------------------------
" Syntax for odd file types
autocmd BufNewFile,BufRead *.sage,*.spyx,*.pyx set filetype=python
autocmd BufNewFile,BufRead *.feature setlocal expandtab
autocmd BufNewFile,BufRead *.rasi set filetype=css

" Toggle Vim's default python behavior
let g:python_recommended_style = 1

" Python folding from SimpylFold, set preview for docstring
let g:SimpylFold_docstring_preview = 1

" LaTeX Fold customization
let g:tex_fold_sec_char="\u00A7"
let g:tex_fold_env_char="\uFC96"
let g:tex_fold_allow_marker=1
let g:tex_fold_override_foldtext=1

let g:tex_comment_nospell=1

" SageTeX Folding
let g:tex_fold_additional_envs = ['sageblock', 'sagesilent']

" Turn off line cursor and turn on spell check, linebreak for markdown
autocmd BufEnter,BufNewFile,BufRead *.md,*.MD setlocal spell spelllang=en
			\ linebreak nocursorline nocursorcolumn

