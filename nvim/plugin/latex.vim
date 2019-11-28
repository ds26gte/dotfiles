" last modified 2019-11-29
" Dorai Sitaram

au filetype tex call s:texOptions()

au bufnewfile *.tex call s:latexboilerplate()

func! s:latexboilerplate()
  let l:doit = 1
  sil 1g/^\\documentclass/let l:doit = 0
  if !l:doit
    return
  endif
  0a
  ZZZZZremoveme \documentclass{article}
  ZZZZZremoveme \usepackage{luatextra}
  ZZZZZremoveme \usepackage[margin=1in,left=1.25in,right=1.25in]{geometry}
  ZZZZZremoveme %\usepackage{luamplib}
  ZZZZZremoveme %\usepackage{fancyvrb}
  ZZZZZremoveme %\DefineShortVerb{\`}

  ZZZZZremoveme \setmainfont{tex gyre termes}

  ZZZZZremoveme \begin{document}
.
  1,/^\s*ZZZZZremoveme\s\\begin{document}\s*$/s/^\s*ZZZZZremoveme\s\+//
  $s/$/\r\r\\end{document}/
  norm k
endfunc

func! Smartquotes()
  ino <buffer> "` “
  ino <buffer> `" ”
  ino <buffer> '` ‘
  ino <buffer> `' ’
endfunc

func! s:texOptions()
  setl efm=l\.%l\ %m
  setl inf
  setl mp=lualatex\ %
  setl tw=65
  call Smartquotes()
endfunc
