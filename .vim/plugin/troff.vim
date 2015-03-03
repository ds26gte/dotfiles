" last modified 2015-03-03

au bufread,bufnewfile *.ms call s:troffOptions()

func! s:troffOptions()
  exec 'au bufwritepre' expand('%') 'sil! call s:troffTypographicNiceties()'
endfunc

func! s:troffTypographicNiceties()
  norm my

  %s:\s\+$::

  %s:Þ:ÞtzpThornTzp:g

  %s:^\s*\(```\+\)$:.\1:g
  %s:^\.\s\+\(```\+\)$:.\1:g
  %s:^\(\.```\+\).*:ÞtzpListingTzp\1:
  call Toggle01(0)
  g:^ÞtzpListingTzp: s:^ÞtzpListingTzp:\=submatch(0) . Toggle01():
  %s:^\(ÞtzpListingTzp0\.```\)`\+:\1:
  %s:^\(ÞtzpListingTzp1\.````\)`\+:\1:
  %s:^\(ÞtzpListingTzp1\.```\)$:\1`:
  g:^ÞtzpListingTzp0: .,/^ÞtzpListingTzp1/ s:^:ÞtzpPreformattedTzp:
  %s:^\(ÞtzpPreformattedTzp\)ÞtzpListingTzp[01]:\1:

  g:^ÞtzpPreformattedTzp: call s:troffTypographicNicetiesInsideCodeEnv()

  v:^ÞtzpPreformattedTzp: call s:troffTypographicNicetiesOutsideCodeEnv()

  %s:^ÞtzpPreformattedTzp::
  %s:ÞtzpThornTzp:Þ:g

  norm `y
endfunc

func! s:troffTypographicNicetiesInsideCodeEnv()
  s:\\:∖:g
endfunc

func! s:troffTypographicNicetiesOutsideCodeEnv()

  " save some \, "

  s:^\.\\":.ÞtzpBackslashTzpÞtzpDoubleQuoteTzp:g
  s:\\\(\[u[0-9A-C]\{4}\]\):ÞtzpBackslashTzp\1:g

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

  s:\\:∖:g

  " restore saved \s

  s:ÞtzpBackslashTzp:\\:g

  " --- preceded by {bol, space, :} and
  " followed by {space, eol}
  " becomes quot dash (u+2015)

  s:\(^\|[ :]\)---\([ ]\|$\):\1―\2:g

  " -- preceded by {bol, space, :} and
  " followed by {space, comma, closing-quote, eol}
  " becomes em dash (u+2014)

  s:\(^\|[ :]\)--\([ ,’”]\|$\):\1—\2:g

  " -- followed by closing quote becomes em dash

  s:--\([’”]\):—\1:g

  " - directly between two digits becomes en dash (u+2013)

  s:\(\d\)-\(\d\):\1–\2:g

  " en dashes flanking a number revert to hyphens
  s:–\([0-9.]\+\)[-–]:-\1-:g
  s:-\([0-9.]\+\)–:-\1-:g

  " - preceded by {bol, space} and
  " followed by opt spaces and then number becomes minus (u+2212)

  s:\(^\|\s\)-\(\s*\.\?\d\):\1−\2:g

endfunc
