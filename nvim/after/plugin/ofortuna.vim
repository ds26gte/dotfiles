" last modified 2019-12-20
" created 2019-03-05
" Dorai Sitaram

if !executable('fortune') ||
      \ exists('$GIT_EXEC_PATH')
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

let s:viCalledWithNoArgs = (argc() == 0) ? 1 : 0

au vimenter * if s:viCalledWithNoArgs | call s:ofortuna() | endif
