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
	let l:my_status .= ' ' . ReadOnlySymobol() . " \uE0BF " . ModifiedSymbol()
	" Fugitive branch
	let l:my_status .= " " . crystalline#left_sep('NormalMode', 'Fill')
			\. MyFugitive() . crystalline#right_sep('NormalMode', 'Fill')
	" filename
	let l:my_status .= " %f" . crystalline#left_sep('', 'Fill')
	" char value
	let l:my_status .= " 0x%B"

	" Go to the right side, print percentage
	let l:my_status .= '%=' . MyFiletype() . " \uE0B9 "
	" Separator, plus file info
	let l:my_status .= "%P" . crystalline#left_mode_sep('')
	" Separator, plus line info
	let l:my_status .= " \uE0A1%2l\u2502 \uE0A3%-2v "

	return l:my_status
endfunction


function! TabLine()
	return crystalline#bufferline(0, 0, 1) . crystalline#left_sep('', 'Fill')
			\. WebDevIconsGetFileTypeSymbol()
endfunction


" Separator things
let g:crystalline_enable_sep = 1  "        
let g:crystalline_tab_separator = "\uE0B9"
let g:crystalline_separators = [ "", "" ]

let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_tabline_fn = 'TabLine'
let g:crystalline_theme = 'onedark'

