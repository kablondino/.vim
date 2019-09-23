function! StatusLine(current, width)
	return crystalline#mode() . crystalline#right_mode_sep('')
			\ . ' %r %m %f %B' . crystalline#right_sep('', 'Fill')
			\ . '%=' . crystalline#left_sep('', 'Fill')
			\ . '%P %2l │ %-2v %{&fenc} %{&ft}'
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

