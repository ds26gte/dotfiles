" last modified 2019-12-28
" created 2019-10-14
" Dorai Sitaram

func! s:beautify()
  if &ft == 'css'
    %!css-beautify
  elseif &ft == 'html' || &ft == 'svg'
    %!html-beautify
  elseif &ft == 'javascript'
    %!js-beautify
  elseif &ft == 'json'
    %!jq .
  else
    echohl warningmsg
    echo 'No beautifier for' &ft
    echohl none
  endif
endfunc

com! Beautify call s:beautify()
