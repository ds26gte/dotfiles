" last modified 2015-05-26

au bufread,bufnewfile *.tex call s:texOptions()

func! s:texOptions()
  setl sua+=.tex

  "doau bufread pretend.txt

  "setl mp=tex2page.lisp\ %
endfunc
