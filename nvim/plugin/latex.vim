" last modified 2019-02-15
" Dorai Sitaram

let tex_flavor = 'tex'

au filetype tex setl tw=65 | call UniCycleTyping()

func! s:latexboilerplate()
  let l:doit = 1
  norm mx
  sil 1g/^\\documentclass/let l:doit = 0
  if l:doit
    0a
    ZZZZZremoveme \documentclass{article}
    ZZZZZremoveme \usepackage{luatextra}
    ZZZZZremoveme \usepackage[margin=1in,left=1.25in,right=1.25in]{geometry}
    ZZZZZremoveme %\usepackage{luamplib}
    ZZZZZremoveme %\usepackage{verbatim}

    ZZZZZremoveme \setmainfont{tex gyre termes}

    ZZZZZremoveme \begin{document}
.
    1,/^\s*ZZZZZremoveme\s\\begin{document}\s*$/s/^\s*ZZZZZremoveme\s//
    $s/$/\r\\end{document}/
  endif
  norm `x
endfunc

com! LXboilerplate call s:latexboilerplate()

func! s:latexme()
  let l:doit = 0
  let l:lastline = line('.')
  if l:lastline > 5
    sil 1,5g/^\s*\\documentclass/ let l:doit = 1
  else
    sil 1,$g/^\s*\\documentclass/ let l:doit = 1
  endif
  if l:doit
    sil !latex %
  endif
endfunc

au filetype tex au bufwritepost <buffer> call s:latexme()
