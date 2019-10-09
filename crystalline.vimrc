" Custom functions for icons
function! MyFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ?
		\ WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : 'no ft') : ''
endfunction
function! MyFileformat()
	return winwidth(0) > 70 ? (WebDevIconsGetFileFormatSymbol() . ' '
		\ . &fileformat) : ''
endfunction

function! ReadOnlySymobol()  " For the status line
	return &readonly ? "\uF023" : "\uF13E"  " Alternative:  U+E0A2
endfunction
function! ModifiedSymbol()
	return &modifiable && &modified ? "\uE240 \uF00D" : "\uE240 \uF00C"
endfunction

function! MyFugitive()
	if &ft !~? 'vimfiler' && exists('*fugitive#head')
		let branch = fugitive#head()
		return (branch !=# '' ? "\uE0A0 ".branch : '')[:24]
	endif
	return ''
endfunction


function! StatusLine(current, width)
	" Print the mode and a separator
	let l:my_status = crystalline#mode() . crystalline#right_mode_sep('Fill')

	" Add in the left status: read-only, modified
	let l:my_status .= ' ' . ReadOnlySymobol() . g:left_subseparator
	" Fugitive branch
	let l:my_status .= ModifiedSymbol() . " "
	let l:my_status .= crystalline#left_sep('NormalMode', 'Fill')
	let l:my_status .= MyFugitive()
	let l:my_status .= crystalline#right_sep('NormalMode', 'Fill')
	" filename
	let l:my_status .= " %f" . crystalline#left_sep('', 'Fill')
	" char value
	let l:my_status .= " 0x%B"

	" Go to the right side, print percentage
	let l:my_status .= '%= ' . MyFiletype() . g:right_subseparator
	" Separator, plus file info
	let l:my_status .= "%P " . crystalline#left_mode_sep('')
	" Separator, plus line info
	let l:my_status .= " \uE0A1%2l\u2502 \uE0A3%-2v "

	return l:my_status
endfunction


function! TabLabel(buf, max_width) abort
	let [l:left, l:name, l:short_name, l:right] =
				\ crystalline#default_tablabel_parts(a:buf, a:max_width)
	return l:left . l:short_name . ' ' . WebDevIconsGetFileTypeSymbol(l:name)
				\. (l:right ==# ' ' ? '' : ' ') . l:right
endfunction

function! TabLine()
	return crystalline#bufferline(0, 0, 1, 1, 'TabLabel',
				\ crystalline#default_tabwidth() + 3)
endfunction


" Separator things
let g:crystalline_enable_sep = 1  "        
let g:crystalline_tab_separator = "\uE0B1"
let g:left_subseparator = " \uE0B1 "
let g:right_subseparator = " \uE0B3 "
let g:crystalline_separators = [ "\uE0B0", "\uE0B2" ]

let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_tabline_fn = 'TabLine'
let g:crystalline_theme = 'onedark'

