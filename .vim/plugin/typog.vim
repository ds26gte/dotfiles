" last modified 2014-12-18

func! TypographicNiceties()
  if exists('b:pure_ascii') && b:pure_ascii
    return
  endif

  norm my

  sil! %s:Þ:&tzpThornTzp:g

  sil! %s:^[  ]*\(```\+\s*\%(\S\+\s*\)\?\)$:ÞtzpListingTzp\1:
  sil! %s:^\.[  ]*\(```\+\):ÞtzpListingTzp.\1:
  call Toggle01(0)
  sil! g:^ÞtzpListingTzp: s:^ÞtzpListingTzp:\=submatch(0) . Toggle01():
  sil! %s:^\(ÞtzpListingTzp1\s*\)\(```\s*\)$:\1`\2:
  sil! g:^ÞtzpListingTzp0: .,/^ÞtzpListingTzp1/ s:^:ÞtzpPreformattedTzp:
  sil! %s:^\(ÞtzpPreformattedTzp\)ÞtzpListingTzp[01]:\1:
  sil! g:^\.[^#A-Z]: s:^:ÞtzpPreformattedTzp:

  sil! g:^ÞtzpPreformattedTzp: s: : :g

  sil! v:^ÞtzpPreformattedTzp: call s:smartquotes_etc()

  if exists('b:special_typography')
    exec 'sil! call' b:special_typography . '()'
    sil! g:^ÞtzpPreformattedTzp: s:[  ]\+$::
  else
    sil! %s/[  ]\+$//
  endif

  sil! %s:^ÞtzpPreformattedTzp::
  sil! %s:\(Þ\)tzpThornTzp:\1:g

  norm `y
endfunc

func! s:smartquotes_etc()
  " save some troff "s
  s:^\.\s*TH\s\+"\(.\{-}\)"\s*$:.TH ÞtzpDoubleQuoteTzp\1ÞtzpDoubleQuoteTzp:
  s:\\":\\ÞtzpDoubleQuoteTzp:g

  " save some tex "s
  s:\(\\font.\{-}\)"\(.\{-}\)":\1ÞtzpDoubleQuoteTzp\2ÞtzpDoubleQuoteTzp:
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

  " --- preceded by {bol, space, :} and
  " followed by {space, eol}
  " becomes quot dash (u+2015)

  s:\(^\|[  :]\)---\([  ]\|$\):\1―\2:g

  " -- preceded by {bol, space, :} and
  " followed by {space, comma, closing-quote, eol}
  " becomes em dash (u+2014)

  s:\(^\|[  :]\)--\([  ,’”]\|$\):\1—\2:g

  " -- followed by closing quote becomes em dash

  s:--\([’”]\):—\1:g

  " - directly between two digits becomes en dash (u+2013)

  s:\(\d\)-\(\d\):\1–\2:g

  " en dashes flanking a number revert to hyphens
  s:–\([0-9.]\+\)[-–]:-\1-:g
  s:-\([0-9.]\+\)–:-\1-:g

  " - preceded by {bol, space} and
  " followed by opt spaces and then number becomes minus (u+2212)

  s:\(^\|[  ]\)-\([  ]*\.\?[0–9]\):\1−\2:g

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

func! Toggle01(...)
  if a:0
    let b:toggle01Value = 1
  else
    let b:toggle01Value = !b:toggle01Value
    return b:toggle01Value
  endif
endfunc

func! s:xdig_fn(biliteral, hexnum, ...)
  exec 'dig' a:biliteral str2nr(a:hexnum, 16)
endfunc

com! -nargs=* Xdig call s:xdig_fn(<f-args>)
