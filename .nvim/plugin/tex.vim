" last modified 2015-06-02

au bufread,bufnewfile *.tex call s:texReadOptions()

au bufwritepre *.tex sil! call s:texWriteOptions()

func! s:texReadOptions()
  setl sua+=.tex

  "doau bufread pretend.txt

  "setl mp=tex2page.lisp\ %
endfunc

func! s:texWriteOptions()
  if !&wm
    return
  endif

  norm my

  %s:\s\+$::

  %s:Þ:ÞtzpThornTzp:g

  g:^\\[pq]{$: .,/^}$/ s:^:ÞtzpPreformattedTzp:

  v:^ÞtzpPreformattedTzp: call s:texTypographicNiceties()

  %s:^ÞtzpPreformattedTzp::
  %s:ÞtzpThornTzp:Þ:g

  norm `y
endfunc

func! s:texTypographicNiceties()
  s\(^\|\s\|(\|\[\|^\*\|\s\*\)\(["']\):\1ÞtzpOpeningQuoteTzp\2:g

  s:ÞtzpOpeningQuoteTzp":“:g
  s:ÞtzpOpeningQuoteTzp':‘:g

  s:":”:g
  s:':’:g

  s:ÞtzpDoubleQuoteTzp:":g

  s:\(^\|[ :]\)--\([ ,’”]\|$\):\1—\2:g

  s:\(^\|\s\)-\(\s*\.\?\d\):\1−\2:g
endfunc
