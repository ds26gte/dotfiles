" last modified 2014-12-13

au bufread,bufnewfile *.vim call s:vimOptions()

au bufread,bufnewfile .{ex,{,n}vim}rc doau bufread pretend.vim

au bufread,bufnewfile txt2page{,_pdf} doau bufread pretend.vim

func! s:vimOptions()
  setl tw=0

  ru indent/vim.vim

  syn region comment oneline start='\s\@<="' end='$'
  syn match comment '^\s*".*$'
  syn region string oneline start='[\\]\@<!"' skip='\\[\\"]' end='"'
  syn region string oneline start='[\\]\@<!\'' skip='\\[\\\']' end='\''
  syn match comment '^".*$'
endfunc