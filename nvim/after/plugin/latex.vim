" last modified 2019-12-15
" Dorai Sitaram

let tex_flavor = 'tex'

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

func! s:texOptions()
  setl efm=l\.%l\ %m
  setl mp=lualatex\ %
endfunc
