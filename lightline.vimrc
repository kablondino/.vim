set noshowmode  " Removes duplicate info on the command line
let g:lightline = {
	\ 'colorscheme': 'deus',
	\ 'tabline': {
	\	'left': [ ['bufferinfo'], ['buff_separator'], ['buffers'], ],
	\   'right': []
	\ },
	\ 'tabline_separator': { 'left': "", 'right': "" },
	\ 'tabline_subseparator': { 'left': "", 'right': ""},
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
	\		'lineinfo': "LN: %2l│Col: %-2v",
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
"	return winwidth(0) > 70 ? (strlen(&filetype) ?
"	\		WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
	return &filetype
endfunction
function! MyFileformat()
"	return winwidth(0) > 70 ? (WebDevIconsGetFileFormatSymbol()) : ''
	return ''
endfunction

function! LightlineReadonly()  " For the status line
"	return &readonly ? "\uF023" : "\uF13E"  " Alternative:  U+E0A2
	return &readonly ? "\U1F512" : "\U1F513"
endfunction
function! LightlineModified()
"	return &modifiable && &modified ? "\uE240 \uF00D" : "\uE240 \uF00C"
	return &modifiable && &modified ? "\U1F4BE \u2716" : "\U1F4BE \u2714"
endfunction

function! LightlineFugitive()
	if &ft !~? 'vimfiler' && exists('*FugitiveHead')
		let branch = FugitiveHead()
		return branch !=# '' ? 'git:'.branch : ''
	endif
	return ''
endfunction

let g:lightline#bufferline#enable_devicons = 0
let g:lightline#bufferline#enable_nerdfont = 0  " For use with nerdfont.vim
let g:lightline#bufferline#modified = " +"
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#read_only = "\U1F512"
let g:lightline#bufferline#more_buffers = "\uE0C6"
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#smart_path = 0
let g:lightline#bufferline#filename_modifier = ':.'  " Show path in buffer

let g:lightline#bufferline#number_map = {
\ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
\ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'}

let g:lightline.separator = { 'left': "", 'right': "" }
let g:lightline.subseparator = { 'left': "", 'right': "" }

