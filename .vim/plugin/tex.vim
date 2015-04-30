" last modified 2015-04-27

au bufread,bufnewfile *.tex call s:texOptions()

func! s:texOptions()
  setl sua+=.tex

  doau bufread pretend.txt

  "setl mp=tex2page.lisp\ %
endfunc
