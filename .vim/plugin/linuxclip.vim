"last change 2014-09-29

if !filereadable('/usr/bin/xsel')
  "xsel unavailable; exit
  finish
endif

com! -range=% Pbcopy <line1>,<line2>w !xsel -bi

com! Pbpaste r !xsel -bo
