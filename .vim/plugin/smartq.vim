"last modified 2014-11-22

func! SmartQuotes()
  norm my
  if !&tw && !&nu
    "skip code files, which usually have tw=0.
    "alpine email also has tw=0 but it also has 'nu'
    return
  endif
  if match(expand('%:r'), '\.') == 0
    "skip files beginning with dot
    norm `y
    return
  endif
  let b:possibleCodeFile = 0
  "skip other code files by inspecting first line
  1 g/^\s*#\S/ let b:possibleCodeFile = 1
  1 g/^#\s*$/ let b:possibleCodeFile = 1
  1 g/^#\s*[Ll]ast\s/ let b:possibleCodeFile = 1
  1 g/^":"/ let b:possibleCodeFile = 1
  1 g/^\s*[(;]/ let b:possibleCodeFile = 1
  if b:possibleCodeFile
    norm `y
    return
  endif

  %s/^\s*\`\`\`\s*\%([[:alpha:]]\+\s*\)\?$/ÞtzpListingTzp&/
  call s:subAlternate(0)
  g/^ÞtzpListingTzp/ s/$/\=s:subAlternate()
  g/^ÞtzpListingTzp.*0$/ .,/^ÞtzpListingTzp.*1$/ s/^/ÞtzpPreformattedTzp/
  v/^ÞtzpPreformattedTzp/ call s:smartQuotesAux()
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

func! s:smartQuotesAux()
    "opening "

    s:\(^\|\s\|(\|\[\|^\*\|\s\*\)":\1“:g

    "opening '

    s:\(^\|\s\|(\|\[\|^\*\|\s\*\)':\1‘:g

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

au bufwritepre * sil! call SmartQuotes()
