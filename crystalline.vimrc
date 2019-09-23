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
		return branch !=# '' ? ' '.branch : ''
	endif
	return ''
endfunction


function! StatusLine(current, width)
	let l:my_status = ''  " Placeholder variable for the status

	" Print the mode and a separator
	let l:my_status .= crystalline#mode() . crystalline#right_mode_sep('Fill')

	" Add in the left status (read-only, modified, filename, char value)
	let l:my_status .= ' ' . ReadOnlySymobol() . ' ' . ModifiedSymbol() . ' '
	let l:my_status .= crystalline#right_sep('Fill', 'Fill') . ' ' . MyFugitive()
	let l:my_status .= crystalline#right_mode_sep('') . '%f 0x%B'

	" Go to the right side, print percentage
	let l:my_status .= '%=' . crystalline#left_sep('Fill', '') . '%P'
	" Separator, plus line info
	let l:my_status .= crystalline#left_sep('Fill', '') . '%2l │ %-2v '
	" Separator, plus file info
	let l:my_status .= crystalline#left_mode_sep('') . MyFileformat() . '│'
	let l:my_status .= MyFiletype()

	return l:my_status
endfunction


function! TabLine()
  let l:vimlabel = has('nvim') ?  ' NVIM ' : ' VIM '
  return crystalline#bufferline(2, len(l:vimlabel), 1) . '%=%#CrystallineTab# ' . l:vimlabel
endfunction


let g:crystalline_enable_sep = 1
let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_tabline_fn = 'TabLine'
let g:crystalline_theme = 'onedark'

set tabline=%!crystalline#bufferline()

