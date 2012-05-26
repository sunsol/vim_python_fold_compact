" python fold plugin
" Maintainer:  sunsolzn@gmail.com
" Date:        2012-5-22
" Version:     0.1
" only for use 4 space instead tab python script
" in .vimrc :let g:dont_use_python_fold_compact=1 ignore this plugin
if exists("g:dont_use_python_fold_compact")
    finish
endif
if exists("b:python_fold_compact_setup_option")
    finish
endif
let b:python_fold_compact_setup_option=1
setlocal shiftwidth=4 
setlocal softtabstop=4  
setlocal smarttab  
setlocal expandtab  
setlocal tabstop=4 
setlocal foldexpr=g:Python_fold_compact()
setlocal foldmethod=expr
if exists("g:Python_fold_compact")
    finish
endif
function g:Python_fold_compact()
    if getline(v:lnum) =~ '^\s*$'  || getline(v:lnum) =~ '^\s*#'
        return '='
    endif
    let r = strlen(matchstr(getline(v:lnum),'^\s*'))
    let l = v:lnum + 1
    while l<=line('$') 
        if getline(l) =~ '^\s*$'
            let l += 1
        else
            break
        endif
    endwhile
    if  l <= line('$') && strlen(matchstr(getline(l),'^\s*')) > r
        return '>' . (r/4+1)
    elseif v:lnum > 1 && getline(v:lnum-1) !~ '^\s*\($\|#\)' && getline(v:lnum-1) =~ '[,[\({]\s*$'
        return '='
    else
        return r/4
    endif
endfunc
