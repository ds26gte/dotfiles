"last modified 2014-08-29

au bufread,bufnewfile *.vim call s:vim_options()

au bufread,bufnewfile .exrc doau bufread pretend.vim

func! s:vim_options()
    setl fo-=r
    setl sw=2
    setl tw=0

    ru indent/vim.vim

    syn clear string
    syn region comment oneline start="\s\@<=\"" end="$"
    syn match comment "^\s*\".*$"
endfunc
