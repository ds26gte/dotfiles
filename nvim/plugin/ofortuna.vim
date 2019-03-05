" Last modified 2019-03-17
" Dorai Sitaram

if !executable('fortune')
  finish
endif

func! s:ofortuna()
  if bufname('%') != ''
    new
  endif
  setl noro
  keepj %d
  keepj 0r !fortune
  keepj sil $ g/^$/d
  let l:voffset = (winheight('%') - line('$'))/2
  let l:i = 1
  while l:i <= l:voffset
    keepj 0s/^/\r/
    let l:i = l:i + 1
  endwhile
  setl nomod ro
endfunc

com! Ofortuna call s:ofortuna()

au vimenter * if argc() == 0 | call s:ofortuna() | endif
