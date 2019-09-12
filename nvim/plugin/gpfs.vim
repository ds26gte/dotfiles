" last change 2019-09-12

if !isdirectory('/gpfs')
  finish
endif

com! Bash let viTerminalBufferCount += 1 | exec 'ter /bin/bash -s \#' . viTerminalBufferCount

set bo=all
set hls
set ls=2
set notgc

nno <leader>f :e<space>

syn off
