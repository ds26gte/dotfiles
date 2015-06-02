"first change 2013-02-18
"last change 2013-03-23

au filetype erlang call s:erlang_options()

func! s:erlang_options()
    setl fo-=o
    setl fo-=r
    setl sw=2
    setl mp=if\ test\ \!\ -d\ ../ebin;
                \then\ mkdir\ ../ebin;fi;
                \erlc\ -o\ ../ebin\ %
endfunc

au bufwritepost *.erl make
