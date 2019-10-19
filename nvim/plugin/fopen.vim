" last modified 2019-10-19
" Dorai Sitaram

let netrw_altv = 1

let netrw_winsize = 80

func! Netrw_open_file_to_right()
  if winnr('$') == 1
    norm v
  else
    norm P
  endif
endfunc

au filetype netrw call s:netrw_options()

func! s:netrw_options()
  nno <buffer> o :call Netrw_open_file_to_right()<cr>
endfunc
