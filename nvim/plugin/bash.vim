" last modified 2019-10-03
" Dorai Sitaram

let g:viTerminalBufferCount = 0

func! OpenBashTerminal()
  if bufname('%') =~ 'term://'
    bd!
  endif
  let g:viTerminalBufferCount += 1
  sp
  exec 'te bash \#' . g:viTerminalBufferCount
  setl scbk=100000
  startinsert
  sp +setl\ mod /tmp/viSessionHasOpenTerminalBuffers
  close
endfunc

com! Bash call OpenBashTerminal()

tno <esc><esc> <c-\><c-n>
