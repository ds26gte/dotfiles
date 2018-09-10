" last modified 2018-09-10
" Dorai Sitaram

func! Lint()
  if &ft == 'css' 
    !csslint --config=$HOME/.csslintrc %
  elseif &ft == 'html'
    !htmlhint --nocolor %
  elseif &ft == 'javascript'
    !jshint %
  elseif &ft == 'json'
    !jsonlint -q %
  else
    echohl directory
    echo 'No linter for' &ft
    echohl none
  endif
endfunc

nmap <leader>l :call Lint()<cr>
