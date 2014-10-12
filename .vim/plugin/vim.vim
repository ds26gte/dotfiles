"last modified 2014-10-11

au bufread,bufnewfile *.vim call s:vim_options()

au bufread,bufnewfile .{ex,{,n}vim}rc doau bufread pretend.vim

au bufread,bufnewfile txt2page{,_pdf} doau bufread pretend.vim

func! s:vim_options()
  setl fo-=r
  setl tw=0

  ru indent/vim.vim

  syn region comment oneline start="\s\@<=\"" end="$"
  syn match comment "^\s*\".*$"
  syn region string oneline start="[\\]\@<!\"" skip="\\[\\\"]" end="\""
  syn region string oneline start="[\\]\@<!'" skip="\\[\\']" end="'"
endfunc
