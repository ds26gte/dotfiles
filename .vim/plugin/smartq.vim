"last modified 2014-11-11

func! SmartQuotes()
  norm my
  sil! %s/^\s*\`\`\`\s*\%([[:alpha:]]\+\s*\)\?$/ÞtzpListingTzp&/
  call SubAlternate(0)
  sil g/^ÞtzpListingTzp/ s/$/\=SubAlternate()
  sil g/^ÞtzpListingTzp.*0$/ .,/^ÞtzpListingTzp.*1$/ s/^/ÞtzpPreformattedTzp/
  v/^ÞtzpPreformattedTzp/ call s:smartQuotesAux()
  sil! %s/^ÞtzpPreformattedTzp//
  sil! %s/^ÞtzpListingTzp\(.*\)[01]$/\1/
  norm `y
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
    "becomes emdash

    s:\(^\|\s\)--\(\s\|,\|[’”]\|$\):\1—\2:g

    " -- followed by closing quote becomes emdash

    s:--\([’”]\):—\1:g

    " - followed by opt spaces and number becomes minus

    s:\(^\|\s\)-\(\s*\.\?[0-9]\):\1−\2:g

    s:^\*\(\s\):•\1:
endfunc

au bufwritepre *.txt call SmartQuotes()
