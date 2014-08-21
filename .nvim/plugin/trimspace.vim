"last modified 2011-09-09

com! Trimspace call Trimspace()

func! Trimspace()
    norm mx
    sil! %s/\s\+$//
    sil! v/./,/./-j
    while getline(1) =~ '^$'
        1d
    endwhile
    while getline('$') =~ '^$'
        $d
    endwhile
    sil! norm `x
    noh
endfunc
