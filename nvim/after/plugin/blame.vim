" last modified 2019-10-29
" created 2019-10-28
" Dorai Sitaram

func! s:blame()
  let l:curr_line = line('.')
  let l:src_file = expand('%:p')
  let l:src_dir = expand('%:p:h')
  exec 'e' split(&bdir, ',')[-1] . '/view.blame.tmp.1'
  exec 'lcd' l:src_dir
  exec '%!git blame' l:src_file
  sil! %s/^.\+\s(\(.\{8}\).\{-}\d\+)/\1/
  setl noma nomod nowrap nu ro
  syn match title /^.\{8}/
  exec l:curr_line
  norm z.
endfunc

com! Blame call s:blame()

nmap <leader>b :Blame<cr>
