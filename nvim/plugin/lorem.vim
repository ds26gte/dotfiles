" last modified 2019-01-26
" Dorai Sitaram

func! s:lorem (...)
  let l:savedFt = &l:ft
  let l:savedTw = &l:tw
  setl ft= tw=65
  let l:n = a:0 ? a:1 : 1
  let l:onBlankLine = v:false
  if match(getline(line('.')), '^\s*$') >= 0
    let l:onBlankLine = v:true
  endif
  let l:precedingBlankLine = v:false
  if line('.') == line('$')
    let l:precedingBlankLine = v:true
  elseif match(getline(line('.') + 1), '^\s*$') >= 0
    let l:precedingBlankLine = v:true
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
