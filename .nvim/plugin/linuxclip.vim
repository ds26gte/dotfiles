"last change 2012-02-23

if !filereadable('/usr/bin/xsel')
    finish
endif

com! -range=% Pbcopy <line1>,<line2>w !xsel --clipboard --input

com! Pbpaste r !xsel --clipboard --output
