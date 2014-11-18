"last modified 2014-11-18

com! -nargs=* GenerateUnicode call GenerateUnicodeFn(<f-args>)

function! GenerateUnicodeFn(first, ...)
  e ~/tmp/unicode.tmp
  %d
  let l:i = str2nr(a:first, 16)
  if a:0 == 0
    let last = l:i + 0xff
  else
    let last = str2nr(a:1, 16)
  endif
  let l:d = ''
  let l:j = 0
  let l:tblwidth = 6
  while l:i <= last
    let l:c = printf('%04X ', l:i)
    let l:c = l:c . nr2char(l:i)
    let l:i += 1
    let l:d = l:d . '        ' . l:c
    let l:j += 1
    if l:j >= l:tblwidth
      $put =l:d
      let l:d = ''
      let l:j = 0
    endif
  endwhile
  $put =l:d
  1d
  sil w
endfunction
