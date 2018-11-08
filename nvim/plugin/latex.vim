" last modified 2019-01-26
" Dorai Sitaram

let tex_flavor = 'tex'

au filetype tex setl tw=65 | call Unicyclebuf()

func! s:latexboilerplate()
  let l:doit = v:true
  norm mx
  sil 1g/^\\documentclass/let l:doit = v:false
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
    1,16s/^\s*ZZZZZremoveme\s//
    $s/$/\r\\end{document}/
  endif
  norm `x
endfunc

com! LXboilerplate call s:latexboilerplate()
