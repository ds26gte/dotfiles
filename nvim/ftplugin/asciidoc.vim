" last modified 2018-08-21
" Dorai Sitaram

setl com=b://,sb:////,eb:////
setl dict=/usr/share/dict/words
setl inf
setl mp=kadoc\ %\ >/dev/null
setl tw=65

"ino <buffer> "` “
"ino <buffer> '` ‘
"ino <buffer> `" ”
"ino <buffer> `' ’

" if file doesn't already have a timestamp, add one at EOF

func! s:addTimestamp()
  if exists('b:dontAddTimestamp')
    return
  endif
  norm mx
  let l:timestampFound = 0
  sil g/\c^.*last\s\+\%(change\|modified\|update\)\&^.*\<\d\{4}-\d\{2}-\d\{2}\>/
        \ let l:timestampFound = 1
  if !l:timestampFound
    $ s/$/\r\r\/\/ Last modified 2018-07-24/
  endif
  norm `x
endfunc 

au bufwritepre <buffer> sil! call s:addTimestamp()
