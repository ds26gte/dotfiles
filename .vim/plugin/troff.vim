" last modified 2015-04-07

au bufread,bufnewfile *.ms call s:troffOptions()

func! s:troffOptions()
  exec 'au bufwritepre' expand('%') 'sil! call s:troffTypographicNiceties()'

  call TxtHilite()

  syn region fctermAC oneline start='^\.=' end='$'

  syn region fcterm44 start='\\fI' end='\\fP'
  syn region fcterm21 start='\\fB' end='\\fP'

  syn region fcterm41 start='\\fC' end='\\fP'
  syn region fcterm41 start='^\.\s*EX$' end='^\.\s*EE$'
endfunc

func! s:troffTypographicNiceties()
  norm my

  %s:\s\+$::

  %s:Þ:ÞtzpThornTzp:g

  g:^\.EX$: .,/^\.EE$/ s:^:ÞtzpPreformattedTzp:

  " g:^ÞtzpPreformattedTzp: call s:troffTypographicNicetiesInsideCodeEnv()

  g:^\.ig\s\+##$: .,/^\.##$/ s:^:ÞtzpPreformattedTzp:

  g:^\.eval$: .,/^\.endeval$/ s:^:ÞtzpPreformattedTzp:

  %s:^\(\.\*\):ÞtzpSectionTzp\1:

  %s:^\.:ÞtzpPreformattedTzp\0:

  v:^ÞtzpPreformattedTzp: call s:troffTypographicNicetiesOutsideCodeEnv()

  %s:^ÞtzpPreformattedTzp::
  %s:^ÞtzpSectionTzp::
  %s:ÞtzpThornTzp:Þ:g

  norm `y
endfunc

func! s:troffTypographicNicetiesInsideCodeEnv()
  s:\\:∖:g
endfunc

func! s:troffTypographicNicetiesOutsideCodeEnv()

  " save some \, "

  " s:^\.\\":.ÞtzpBackslashTzpÞtzpDoubleQuoteTzp:g
  " s:\\\(\[u[0-9A-C]\{4}\]\):ÞtzpBackslashTzp\1:g
  " s:\\\(f[BCIP]\):ÞtzpBackslashTzp\1:g
  " s:\\\(\*\[\):ÞtzpBackslashTzp\1:g

  " save some "
  s:\(\\\w*\)":\1ÞtzpDoubleQuoteTzp:g

  " opening ", ' become u+201c, u+2018 resply

  s:\(^\|\s\|(\|\[\|^\*\|\s\*\)\(["']\):\1ÞtzpOpeningQuoteTzp\2:g

  s:ÞtzpOpeningQuoteTzp":“:g

  s:ÞtzpOpeningQuoteTzp':‘:g

  " closing " becomes u+201d

  s:":”:g

  " closing ' becomes u+2019

  s:':’:g

  " restore saved "s

  s:ÞtzpDoubleQuoteTzp:":g

  " \ becomes u+2216

  " s:\\:∖:g

  " restore saved \s

  " s:ÞtzpBackslashTzp:\\:g

  " -- preceded by {bol, space, :} and
  " followed by {space, comma, closing-quote, eol}
  " becomes em dash (u+2014)

  s:\(^\|[ :]\)--\([ ,’”]\|$\):\1—\2:g

  " -- followed by closing quote becomes em dash

  s:--\([’”]\):—\1:g

  " - preceded by {bol, space} and
  " followed by opt spaces and then number becomes minus (u+2212)

  s:\(^\|\s\)-\(\s*\.\?\d\):\1−\2:g

endfunc
