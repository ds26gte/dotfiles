" last modified 2015-03-01

au bufread,bufnewfile *.tex call s:texOptions()

func! s:texOptions()
  doau bufread pretend.txt

  "setl mp=tex2page.lisp\ %
endfunc
