set noshowmode  " Removes duplicate info on the command line
let g:lightline = {
	\ 'colorscheme': 'deus',
	\ 'tabline': {
	\	'left': [ ['bufferinfo'], ['buff_separator'], ['buffers'], ],
	\	'right': [ ['close'], ],
	\ },
	\ 'tabline_separator': { 'left': "\uE0BC", 'right': "\uE0BA" },
	\ 'tabline_subseparator': { 'left': "\uE0BD", 'right': "\uE0BD"},
	\
	\ 'active': {
	\	'left': [ ['mode', 'spell'],
	\			['readonly', 'modified', 'gitbranch', 'filename'],
	\			['char_hex_value'] ],
	\	'right': [ ['lineinfo'], ['percent'],
	\			['fileformat', 'fileencoding', 'filetype'] ],
	\ },
	\
	\ 'inactive': {
	\	'left': [ ['big_separator'],
	\			['readonly', 'modified', 'gitbranch', 'filename'] ],
	\	'right': [ ['lineinfo'], ['percent'],
	\			['fileformat', 'fileencoding', 'filetype'] ],
	\ },
	\
	\ 'component_expand': {'buffers': 'lightline#bufferline#buffers'},
	\ 'component_type': {'buffers': 'tabsel'},
	\
	\ 'component': {
	\		'char_hex_value': '0x%B',
	\		'filename': '%t',
	\		'lineinfo': "\uE0A1%2l│\uE0A3%-2v",
	\		'buff_separator': '',
	\		'big_separator': '      ',
	\ },
	\ 'component_function': {
	\		'filetype': 'MyFiletype',
	\		'fileformat': 'MyFileformat',
	\		'bufferinfo': 'lightline#buffer#bufferinfo',
	\		'readonly': 'LightlineReadonly',
	\		'modified': 'LightlineModified',
	\		'gitbranch': 'LightlineFugitive'
	\ }, }
function! MyFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ?
	\		WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction
function! MyFileformat()
	return winwidth(0) > 70 ? (WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineReadonly()  " For the status line
	return &readonly ? "\uF023" : "\uF13E"  " Alternative:  U+E0A2
endfunction
function! LightlineModified()
	return &modifiable && &modified ? "\uE240 \uF00D" : "\uE240 \uF00C"
endfunction

function! LightlineFugitive()
	if &ft !~? 'vimfiler' && exists('*FugitiveHead')
		let branch = FugitiveHead()
		return branch !=# '' ? ' '.branch : ''
	endif
	return ''
endfunction

let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#modified = "\uF040"
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#read_only = "\uF023"

let g:lightline#bufferline#number_map = {
\ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
\ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'}

let g:lightline.separator = { 'left': "\uE0B8", 'right': "\uE0BE" }
let g:lightline.subseparator = { 'left': "\uE0BF", 'right': "\uE0BF" }

