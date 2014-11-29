" last modified 2014-11-28

au bufread,bufnewfile *.vim call s:vimOptions()

au bufread,bufnewfile .{ex,{,n}vim}rc doau bufread pretend.vim

au bufread,bufnewfile txt2page{,_pdf} doau bufread pretend.vim

func! s:vimOptions()
  setl fo-=r

  ru indent/vim.vim

  syn region comment oneline start='\s\@<="' end='$'
  syn match comment '^\s*".*$'
  syn region string oneline start='[\\]\@<!"' skip='\\[\\"]' end='"'
  syn region string oneline start='[\\]\@<!\'' skip='\\[\\\']' end='\''
  syn match comment '^".*$'
endfunc
