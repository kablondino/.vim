" REMAP ARROW KEYS! to switch between buffers and tabs
nnoremap <Left> :bprev<return>
nnoremap <Right> :bnext<return>
nnoremap <S-Left> :tabprevious<return>
nnoremap <S-Right> :tabnext<return>
" Can also use gT or <C-PageUp> and gt or <C-PageDown> for next and previous
" tabs, respectively

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

" Hit F3 to unhighlight searched term
nnoremap <silent><F3> :noh<return>

" Colorizer Toggle, REQUIRES Colorizer to be loaded!
nnoremap <silent><F4> :ColorToggle<return>

" Toggle RELATIVE line numbers on and off with Ctrl-K (upper or lower case)
function! g:NumberToggle()
	if &relativenumber == 0
		set relativenumber
	else
		set norelativenumber
	endif
endfunction
nnoremap <silent><C-K> :call g:NumberToggle()<return>

" Toggle fold column appearence with <C-H> (for now)
function! g:FoldToggle()
	if &foldcolumn == 0 && &foldmethod == 'indent'
		setlocal foldcolumn=3
	else
		setlocal foldcolumn=0
	endif

	" Toggle method indent from manual to indent to syntax and back
	if &foldmethod == 'manual'
		setlocal foldmethod=indent
	elseif &foldmethod == 'indent'
		setlocal foldmethod=manual
	endif
endfunction
nnoremap <silent><C-H> :call g:FoldToggle()<return>

