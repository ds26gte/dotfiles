" last modified 2019-01-28
" Dorai Sitaram

func! s:lorem (...)
  let l:savedFt = &l:ft
  let l:savedTw = &l:tw
  setl ft= tw=65

  let l:numGrafs = a:0 ? a:1 : 1

  let l:inEmptyFile = 0
  let l:onBlankLine = 0
  let l:precedingBlankLine = 0

  if wordcount().chars == 0
    let l:inEmptyFile = 1
  endif

  sil .g/^\s*$/ let l:onBlankLine = 1

  if line('.') == line('$')
    let l:precedingBlankLine = 1
  else
    sil .+1g/^\s*$/ let l:precedingBlankLine = 1
  endif

  if !l:onBlankLine
    s/$/\r
  endif

  norm mx
  if !l:precedingBlankLine
    s/$/\r
    'x
  endif

  exec 'r !lorem -p ' . l:numGrafs
  norm gq'x

  if l:inEmptyFile
    norm mx
    1d
    norm 'x
  endif

  norm $

  let &l:tw = l:savedTw
  let &l:ft = l:savedFt
endfunc

com! -nargs=? Lorem call s:lorem(<args>)
