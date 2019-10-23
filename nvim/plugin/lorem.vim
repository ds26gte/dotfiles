" last modified 2019-10-23
" Dorai Sitaram

func! s:lorem(...)
  let l:savedTw = &l:tw
  setl tw=65

  norm mx

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
    'x
  endif

  if !l:onBlankLine
    s/$/\r
  endif
  norm my

  if !l:precedingBlankLine
    s/$/\r
    'y
  endif

  exec 'r !lorem -p' l:numGrafs
  norm gq'y

  if l:inEmptyFile
    1d
  else
    norm `x
  endif

  let &l:tw = l:savedTw
endfunc

com! -nargs=? Lorem call s:lorem(<args>)
