let b:current_syntax = ''
unlet b:current_syntax
syntax include @Python syntax/python.vim
syntax region pythonSnip matchgroup=Snip start='\\begin{sageblock}' end='\\end{sageblock}' containedin=@TeX contains=@Python
syntax region pythonSnip matchgroup=Snip start='\\begin{sagesilent}' end='\\end{sagesilent}' containedin=@TeX contains=@Python
syntax region pythonSnip matchgroup=Snip start='\\sageplot{' end='}' containedin=@TeX contains=@Python
syntax region pythonSnip matchgroup=Snip start='\\sageplot\[' end='}' containedin=@TeX contains=@Python
syntax region pythonSnip matchgroup=Snip start='\\sage{' end='}' containedin=@TeX contains=@Python
syntax region pythonSnip matchgroup=Snip start='\\sage\[' end='}' containedin=@TeX contains=@Python
hi link Snip SpecialComment

" Turn off line cursor and turn on spell check
autocmd BufEnter,BufNewFile,BufRead *.tex setlocal spell spelllang=en
			\ linebreak nocursorline nocursorcolumn
" Turn spell check ON for ALL non-comments in tex (latex) files
autocmd BufEnter,BufNewFile,BufRead *.tex syntax spell toplevel

" Fold customization
let g:tex_fold_sec_char="\u00A7"
let g:tex_fold_env_char="\uFC96"
let g:tex_fold_allow_marker=1
let g:tex_fold_override_foldtext=1

let g:tex_comment_nospell=1


" SageTeX Things
" Add SageTeX Python highlighting WITHIN TeX file
let b:current_syntax = ''
unlet b:current_syntax
syntax include @TeX syntax/tex.vim

" SageTeX Folding
let g:tex_fold_additional_envs = ['sageblock', 'sagesilent']

