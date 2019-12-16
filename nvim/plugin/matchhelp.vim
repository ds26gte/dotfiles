" last modified 2019-12-17
" created 2019-10-24
" Dorai Sitaram

" identify strings and comments not so much to syntax-highlight them as to help
" the vim-matchup plugin skip over parens within them

func! s:identifyString(qc, ...)
  " first arg is the quote character used to delimit the string.
  " second arg, if any, implies strings can't span multiple lines
  let l:oneline = ''
  if a:0 > 0
    let l:oneline = 'oneline'
  endif
  exec 'syn region string' l:oneline
        \ 'start=/\(\\\)\@<!' . a:qc . '/ skip=/\\[\\"'']/ end=/' . a:qc . '/'
endfunc

func! s:identifyComment(cc)
  exec 'syn region comment oneline'
        \ 'start=/' . a:cc . '/ end=/$/'
endfunc

func! s:identifyLispCharacter()
  syn match string /#\\[(){}\[\]";]/
endfunc

au filetype vim call s:identifyComment('"')

au filetype lisp,scheme call s:identifyLispCharacter()

au filetype css,html,lisp,scheme,sh,svg call s:identifyString('"')

au filetype lua,vim call s:identifyString('"', 1) | call s:identifyString("'", 1)

au filetype css,html,sh call s:identifyString("'")

au filetype lisp,scheme call s:identifyComment(';')

au filetype lua call s:identifyComment('--')

au filetype sh call s:identifyComment('#')
