"last modified 2014-09-03

au bufread,bufnewfile *.vim call s:vim_options()

au bufread,bufnewfile .exrc doau bufread pretend.vim

func! s:vim_options()
  setl fo-=r
  setl tw=0

  ru indent/vim.vim

  syn clear string
  syn region comment oneline start="\s\@<=\"" end="$"
  syn match comment "^\s*\".*$"
endfunc
