" last modified 2014-12-06

au bufread,bufnewfile *.tex call s:texOptions()

func! s:texOptions()
  doau bufread pretend.txt

  setl mp=tex2page.lisp\ %
endfunc
