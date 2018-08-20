" last modified 2018-08-20
" Dorai Sitaram

func! s:HTMLhint()
  !htmlhint --nocolor % | tail -n +3
endfunc

au bufwritepost <buffer> call s:HTMLhint()
