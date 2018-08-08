" last modified 2018-08-18
" Dorai Sitaram

func! s:lorem (...)
  let l:savedFt = &l:ft
  let l:savedTw = &l:tw
  setl ft= tw=65
  let l:n = a:0 ? a:1 : 1
  let l:onBlankLine = 0
  if match(getline(line('.')), '^\s*$') >= 0
    let l:onBlankLine = 1
  endif
  let l:precedingBlankLine = 0
  if line('.') == line('$')
    let l:precedingBlankLine = 1
  elseif match(getline(line('.') + 1), '^\s*$') >= 0
    let l:precedingBlankLine = 1
  endif
  if !l:onBlankLine
    s/$/\r
  endif
  norm mx
  if !l:precedingBlankLine
    s/$/\r
    'x
  endif
  exec 'r !lorem -p ' . l:n
  norm gq'x
  let &l:tw = l:savedTw
  let &l:ft = l:savedFt
endfunc

com! -nargs=? Lorem call s:lorem(<args>)
