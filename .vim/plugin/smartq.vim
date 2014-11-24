"last modified 2014–11–23

func! SmartQuotes()
  norm my

  %s/^\s*\`\`\`\s*\%([[:alpha:]]\+\s*\)\?$/ÞtzpListingTzp&/
  call s:subAlternate(0)
  g/^ÞtzpListingTzp/ s/$/\=s:subAlternate()
  g/^ÞtzpListingTzp.*0$/ .,/^ÞtzpListingTzp.*1$/ s/^/ÞtzpPreformattedTzp/
  v/^ÞtzpPreformattedTzp/ call s:smartQuotesAux()
  call s:verbatimizeLeadingSpaces()
  %s/^ÞtzpPreformattedTzp//
  %s/^ÞtzpListingTzp\(.*\)[01]$/\1/

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

func! s:verbatimizeLeadingSpaces()
  while 1
    let b:leadingSpacesLeft = 0
    g/^\s\s*\s\S/ let b:leadingSpacesLeft = 1
    if b:leadingSpacesLeft
      %s/^\(\s\s*\)\s\(\S\)/\1 \2/  "space here is actually u+00a0
    else
      break
    endif
  endwhile
endfunc

func! s:smartQuotesAux()
    "opening "

    s:\(^\|\s\|(\|\[\|^\*\|\s\*\)":\1“:g

    "opening '

    s:\(^\|\s\|(\|\[\|^\*\|\s\*\)':\1‘:g

    "closing "

    s:":”:g

    "closing '

    s:':’:g

    " --- preceded by {bol, space} and
    " followed by {space, eol}
    " becomes quot dash (u+2015)

    s:\(^\|\s\)---\(\s\|$\):\1―\2:g

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

    s:\(^\|\s\)-\(\s*\.\?[0–9]\):\1−\2:g

    " * following bol and followed by space
    " becomes bullet (u+2022)

    s:^\*\(\s\):•\1:

    " * becomes u+22c6

    s:\*:⋆:g

    " bol-number-dot-space: make space verbatim

    s:^\(\d\+\.\)\s:\1 :

    " line with leading space also gets 2 trailing spaces
    s:^\(\s.*\S\)\s\{0,1}$:\1  :
endfunc

au bufwritepre *.txt sil! call SmartQuotes()
