let g:gitgrepprg="git\\ grep\\ -n\\ -i"

function! GitGrep(args)
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:gitgrepprg
    execute "silent! grep " . a:args
    botright copen
    let &grepprg=grepprg_bak
    let b:GitGrepWindow = 1
    exec "redraw!"
endfunction

function! GitGrepAdd(args)
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:gitgrepprg
    execute "silent! grepadd " . a:args
    botright copen
    let &grepprg=grepprg_bak
    let b:GitGrepWindow = 1
    exec "redraw!"
endfunction

function! LGitGrep(args)
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:gitgrepprg
    execute "silent! lgrep " . a:args
    botright lopen
    let &grepprg=grepprg_bak
    let b:GitGrepWindow = 1
    exec "redraw!"
endfunction

function! LGitGrepAdd(args)
    let grepprg_bak=&grepprg
    exec "set grepprg=" . g:gitgrepprg
    execute "silent! lgrepadd " . a:args
    botright lopen
    let &grepprg=grepprg_bak
    let b:GitGrepWindow = 1
    exec "redraw!"
endfunction

command! -nargs=* -complete=file G call GitGrep(<q-args>)
command! -nargs=* -complete=file GitGrepAdd call GitGrepAdd(<q-args>)
command! -nargs=* -complete=file LGitGrep call LGitGrep(<q-args>)
command! -nargs=* -complete=file LGitGrepAdd call LGitGrepAdd(<q-args>)

nnoremap gr :G "\<<cword>\>"<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:GitGrepWindow")) | q | endif
