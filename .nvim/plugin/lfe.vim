"first modified 2013-02-23
"last modified 2013-03-23

au bufread,bufnewfile *.lfe setf lisp | call s:lfe_options()

func! s:lfe_options()
    setl fo-=o
    setl fo-=r
    setl lw+=defmodule,defrecord,fletrec
    setl mp=if\ test\ \!\ -d\ ../ebin;
                \then\ mkdir\ ../ebin;fi;
                \lfec\ -o\ ../ebin\ %
endfunc

au bufwritepost *.lfe make
