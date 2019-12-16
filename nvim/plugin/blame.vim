" last modified 2019-12-18
" created 2019-10-28
" Dorai Sitaram

func! s:blame()
  let l:currLine = line('.')
  let l:srcFile = expand('%:p')
  let l:srcDir = expand('%:p:h')
  exec 'e' split(&bdir, ',')[-1] . '/view.blame.tmp.1'
  exec 'lcd' l:srcDir
  exec '%!git blame' l:srcFile
  sil! %s/^.\+\s(\(.\{8}\).\{-}\d\+)/\1/
  setl nomod nowrap nu
  syn match diffchange /^.\{8}/
  exec l:currLine
  norm z.
endfunc

com! Blame call s:blame()
