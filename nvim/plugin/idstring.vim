" last modified 2019-10-26
" Dorai Sitaram

" this identifies a string not so much to syntax-highlight it as to help
" the vim-matchup plugin skip over parens within it

func! IdentifyString(qc, ...)
  " first arg is the quote character used to delimit the string.
  " second arg, if any, implies strings can't span multiple lines
  let l:oneline = ''
  if a:0 == 1
    let l:oneline = 'oneline'
  endif
  exec 'syn region string' l:oneline
        \ 'start=/\(\\\)\@<!' . a:qc . '/ skip=/\\[\\"'']/ end=/' . a:qc . '/'
endfunc

au filetype lisp,scheme,sh call IdentifyString('"')

au filetype lua,vim call IdentifyString('"', 1) | call IdentifyString('''', 1)

au filetype sh call IdentifyString('''')
