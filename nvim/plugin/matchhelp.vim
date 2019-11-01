" last modified 2019-11-01
" created 2019-10-24
" Dorai Sitaram

" identify strings and comments not so much to syntax-highlight them as to help
" the vim-matchup plugin skip over parens within them

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

func! IdentifyComment(cc)
  exec 'syn region comment oneline'
        \ 'start=/' . a:cc . '/ end=/$/'
endfunc

au filetype lisp,scheme,sh call IdentifyString('"') | call IdentifyComment(';')

au filetype lua,vim call IdentifyString('"', 1) | call IdentifyString('''', 1)

au filetype lua call IdentifyComment('--')

au filetype sh call IdentifyString('''')

au filetype vim call IdentifyComment('"')
