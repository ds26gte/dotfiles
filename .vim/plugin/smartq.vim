" last modified 2014-11-25

func! SmartQuotes()
  norm my

  sil! %s/^\s*\`\`\`\s*\%([[:alpha:]]\+\s*\)\?$/ÞtzpListingTzp&/
  call s:toggleZeroOne(0)
  sil! g/^ÞtzpListingTzp/ s/$/\=s:toggleZeroOne()
  sil! g/^ÞtzpListingTzp.*0$/ .,/^ÞtzpListingTzp.*1$/ s/^/ÞtzpPreformattedTzp/
  sil! v/^ÞtzpPreformattedTzp/ call s:smartQuotesAux()
  sil! call s:verbatimizeLeadingSpaces()
  sil! %s/^ÞtzpPreformattedTzp//
  sil! %s/^ÞtzpListingTzp\(.*\)[01]$/\1/

  norm `y
endfunc

func! s:toggleZeroOne(...)
  if a:0
    let b:toggleZeroOneValue = 1
  else
    let b:toggleZeroOneValue = !b:toggleZeroOneValue
    return b:toggleZeroOneValue
  endif
endfunc

func! s:verbatimizeLeadingSpaces()
  " convert all but the 1st leading space to u+00a0
  while 1
    let b:leadingSpacesLeft = 0
    g/^\s\s*\s\S/ let b:leadingSpacesLeft = 1
    if b:leadingSpacesLeft
      %s/^\(\s\s*\)\s\(\S\)/\1 \2/  " space here is actually u+00a0
    else
      break
    endif
  endwhile
endfunc

func! s:smartQuotesAux()
    " opening " becomes u+201c

    s:\(^\|\s\|(\|\[\|^\*\|\s\*\)":\1“:g

    " opening ' becomes u+2018

    s:\(^\|\s\|(\|\[\|^\*\|\s\*\)':\1‘:g

    " closing " becomes u+201d

    s:":”:g

    " closing ' becomes u+2019

    s:':’:g

    " --- preceded by {bol, space} and
    " followed by {space, eol}
    " becomes quot dash (u+2015)

    s:\(^\|\s\)---\(\s\|$\):\1―\2:g

    " -- preceded by {bol, space} and
    " followed by {space, comma, closing-quote, eol}
    " becomes em dash (U+2014)

    s:\(^\|\s\)--\(\s\|[,’”]\|$\):\1—\2:g

    " -- followed by closing quote becomes em dash

    s:--\([’”]\):—\1:g

    " - directly between two digits becomes en dash (U+2013)

    s:\(\d\)-\(\d\):\1–\2:g

    " - preceded by {bol, space} and
    " followed by opt spaces and then number becomes minus (U+2212)

    s:\(^\|\s\)-\(\s*\.\?[0–9]\):\1−\2:g

    " * following bol and followed by space
    " becomes bullet (u+2022)

    s:^\*\(\s\):•\1:

    " * becomes u+22c6

    s:\*:⋆:g

    " bol-number-dot-space: make space verbatim

    s:^\(\d\+\.\)\s:\1 :

    " line with leading space also gets 2 trailing spaces
    if !&tw
      " but not for alpine
    else
      s:^\(\s.*\S\)\s\{0,1}$:\1  :
    endif
endfunc
