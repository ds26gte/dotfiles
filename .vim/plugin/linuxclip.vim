"last change 2014-09-13

if exists('+clipboard')
  "clipboard works; no need for xsel
  finish
endif

if !filereadable('/usr/bin/xsel')
  "xsel unavailable; exit
  finish
endif

com! -range=% Pbcopy <line1>,<line2>w !xsel -bi

com! Pbpaste r !xsel -bo
