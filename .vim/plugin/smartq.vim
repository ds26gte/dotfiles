"last modified 2014-11-20

func! SmartQuotes()
  if !&tw && &sbr != ''
    return
  endif
  norm my
  sil! %s/^\s*\`\`\`\s*\%([[:alpha:]]\+\s*\)\?$/ÞtzpListingTzp&/
  call s:subAlternate(0)
  sil g/^ÞtzpListingTzp/ s/$/\=s:subAlternate()
  sil g/^ÞtzpListingTzp.*0$/ .,/^ÞtzpListingTzp.*1$/ s/^/ÞtzpPreformattedTzp/
  v/^ÞtzpPreformattedTzp/ call s:smartQuotesAux()
  sil! %s/^ÞtzpPreformattedTzp//
  sil! %s/^ÞtzpListingTzp\(.*\)[01]$/\1/
  norm `y
endfunc

func! s:subAlternate(...)
  if !exists('b:subAlternateP')
    let b:subAlternateP = 1
  endif
  if a:0
    let b:subAlternateP = 1
  else
    let b:subAlternateP = !b:subAlternateP
    return b:subAlternateP
  endif
endfunc

func! s:smartQuotesAux()
    "opening "

    s:\(^\|\s\|(\|^\*\|\s\*\)":\1“:g

    "opening '

    s:\(^\|\s\|(\|^\*\|\s\*\)':\1‘:g

    "closing "

    s:":”:g

    "closing '

    s:':’:g

    " -- preceded by {bol, space} and
    "followed by {space, comma, closing-quote, eol}
    "becomes emdash (U+2014)

    s:\(^\|\s\)--\(\s\|[,’”]\|$\):\1—\2:g

    " -- followed by closing quote becomes emdash

    s:--\([’”]\):—\1:g

    " - directly between two digits becomes endash (U+2013)

    s:\(\d\)-\(\d\):\1–\2:g

    " - preceded by {bol, space} and
    "followed by opt spaces and then number becomes minus (U+2212)

    s:\(^\|\s\)-\(\s*\.\?[0-9]\):\1−\2:g

    s:^\*\(\s\):•\1:
endfunc

au bufwritepre * call SmartQuotes()
