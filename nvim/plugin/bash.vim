" last modified 2019-11-07
" created 2019-09-27
" Dorai Sitaram

au termopen * call s:termOpenOptions()

func! s:termOpenOptions()
  setl scbk=100000
  startinsert
  sp +setl\ mod /tmp/viSessionHasOpenTerminalBuffers
  close
endfunc

let s:viTerminalBufferCount = 0

func! s:openBashTerminal()
  if bufname('%') =~ 'term://'
    bd!
  endif
  let s:viTerminalBufferCount += 1
  sp
  exec 'te bash \#' . s:viTerminalBufferCount
endfunc

com! Bash call s:openBashTerminal()

tno <esc><esc> <c-\><c-n>
