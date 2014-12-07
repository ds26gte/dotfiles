" last modified 2014-12-06

func! TypographicNiceties()
  if exists('b:pure_ascii') && b:pure_ascii
    return
  endif

  norm my

  sil! %s:Þ:&tzpThornTzp:g
  sil! %s:^\s*\(```\+\s*\%(\S\+\s*\)\?\)$:ÞtzpListingTzp\1:
  call Toggle01(0)
  sil! g:^ÞtzpListingTzp: s:^ÞtzpListingTzp:\=submatch(0) . Toggle01():
  sil! %s:^\(ÞtzpListingTzp1\s*\)\(```\s*\)$:\1`\2:
  sil! g:^ÞtzpListingTzp0: .,/^ÞtzpListingTzp1/ s:^:ÞtzpPreformattedTzp:

  sil! v:^ÞtzpPreformattedTzp: call s:smartQuotesEtc()

  if expand('%:t') =~ '^pico\.\d\+$'
    " flushleft lines should end in space;
    " nonflushleft lines should not
    sil! v:^ÞtzpPreformattedTzp: s:^\S.*\S$:& :
    sil! s:^ \(.*\S\) \+$: \1:
  endif

  if &mp =~ '^pan'
    sil! call s:verbatimizeLeadingSpaces()
  endif

  sil! %s:^ÞtzpPreformattedTzp::
  sil! %s:^ÞtzpListingTzp[01]::
  sil! %s:\(Þ\)tzpThornTzp:\1:g

  norm `y
endfunc

func! Toggle01(...)
  if a:0
    let b:toggle01Value = 1
  else
    let b:toggle01Value = !b:toggle01Value
    return b:toggle01Value
  endif
endfunc

func! s:verbatimizeLeadingSpaces()
  " for nonflushleft lines
  %s:^ : : " ensure leading space is real space, not u+00a0
  " add 2 trailing spaces after
  %s:^ \(.*\S\) \{0,1}$: \1  :
  " for flushleft lines, remove all trailing space
  %s:^\(\S.*\S\)\s\+$:\1:
  " convert all but 1st leading space to u+00a0
  while 1
    let b:leadingSpacesLeft = 0
    " second space in brackets is actually u+00a0
    g:^ [  ]* \S: let b:leadingSpacesLeft = 1
    if b:leadingSpacesLeft
      %s:^ \([  ]*\) \(\S\): \1 \2: " space after \1 is actually u+00a0
    else
      break
    endif
  endwhile
endfunc

func! s:smartQuotesEtc()
  " save some troff "s
  s:^\.\s*TH\s\+"\(.\{-}\)"\s*$:.TH ÞtzpDoubleQuoteTzp\1ÞtzpDoubleQuoteTzp:
  s:\\":\\ÞtzpDoubleQuoteTzp:g

  " save some tex "s
  s:^\(\s*\\font.\{-}\)"\(.\{-}\)":\1ÞtzpDoubleQuoteTzp\2ÞtzpDoubleQuoteTzp:
  s:\(\\char\)":\1ÞtzpDoubleQuoteTzp:g

  " opening " becomes u+201c

  s:\(^\|\s\|(\|\[\|^\*\|\s\*\)":\1“:g

  " opening ' becomes u+2018

  s:\(^\|\s\|(\|\[\|^\*\|\s\*\)':\1‘:g

  " closing " becomes u+201d

  s:":”:g

  " closing ' becomes u+2019

  s:':’:g

  " restore saved "s
  s:ÞtzpDoubleQuoteTzp:":g

  " --- preceded by {bol, space} and
  " followed by {space, eol}
  " becomes quot dash (u+2015)

  s:\(^\|\s\)---\(\s\|$\):\1―\2:g

  " -- preceded by {bol, space} and
  " followed by {space, comma, closing-quote, eol}
  " becomes em dash (u+2014)

  s:\(^\|\s\)--\(\s\|[,’”]\|$\):\1—\2:g

  " -- followed by closing quote becomes em dash

  s:--\([’”]\):—\1:g

  " - directly between two digits becomes en dash (u+2013)

  s:\(\d\)-\(\d\):\1–\2:g

  " - preceded by {bol, space} and
  " followed by opt spaces and then number becomes minus (u+2212)

  s:\(^\|\s\)-\(\s*\.\?[0–9]\):\1−\2:g

  if &mp =~ '^pan'
    " * following bol and followed by space
    " becomes bullet (u+2022)

    s:^\*\(\s\):•\1:

    " other *s become u+22c6
    s:\*:⋆:g

    " bol-number-dot-space: make space verbatim

    s:^\(\d\+\.\)\s:\1 :

  endif
endfunc

func! Asciiize()
  let b:pure_ascii = 1

  sil! s: : :g
  sil! s:[⋆•]:*:g
  sil! s:[‘’]:':g
  sil! s:[“”]:":g
  sil! s:―:---:g
  sil! s:—:--:g
  sil! s:[–−]:-:g
endfunc

func! s:xdigFunc(biliteral, hexnum, ...)
  exec 'dig' a:biliteral str2nr(a:hexnum, 16)
endfunc

com! -nargs=* Xdig call s:xdigFunc(<f-args>)
