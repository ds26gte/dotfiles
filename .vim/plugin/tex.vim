" last modified 2014-12-03

au bufread,bufnewfile *.tex call s:texOptions()

func! s:texOptions()
  setl mp=tex2page.lisp\ %
endfunc
