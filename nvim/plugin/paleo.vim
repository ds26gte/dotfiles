" last change 2019-09-27

if has('nvim')
  finish
endif

exec $EXINIT

func! OpenBashTerminal()
  if bufname('%') =~ '!/bin/bash'
    bd!
  endif
  let g:viTerminalBufferCount += 1
  sil! tabe %
  exec 'ter /bin/bash -s \#' . g:viTerminalBufferCount
endfunc

set bo=all
set hls
set ls=2
set notgc
