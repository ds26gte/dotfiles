"last modified 2014-08-26

au bufread,bufnewfile *.vim call s:vim_options()

au bufread,bufnewfile .exrc doau bufread pretend.vim

func! s:vim_options()
    setl fo-=r
    setl sw=2
    setl tw=0

    ru indent/vim.vim

    syn clear string
    syn region comment oneline start="\s\@<=\"" end="$"
    syn region string oneline start="\\\@<!\"" skip="\\[\\\"]" end="\""
    syn match comment "^\s*\".*$"
endfunc
