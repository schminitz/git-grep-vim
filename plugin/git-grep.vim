let g:gitgrepprg="git\\ grep\\ -n\\ -i"

function! GitGrep(args)
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:gitgrepprg
    execute "silent! grep " . "'" . a:args . "'"
    botright copen
    let &grepprg=grepprg_bak
    let b:GitGrepWindow = 1
    exec "redraw!"
endfunction

function! VisualGitGrep()
    normal gv"xy
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:gitgrepprg
    execute "silent! grep " . "'" . @x . "'"
    botright copen
    let &grepprg=grepprg_bak
    let b:GitGrepWindow = 1
    exec "redraw!"
endfunction

command! -nargs=* -complete=file G call GitGrep(<q-args>)

nnoremap gr :G "\<<cword>\>"<CR>
vnoremap gr :call VisualGitGrep()<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:GitGrepWindow")) | q | endif
