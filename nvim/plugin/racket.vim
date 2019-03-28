" last modified 2019-04-01
" Dorai Sitaram

au filetype scheme,lisp call s:racketOptions()

func! s:racketOptions()
  "this is so matchit works correctly for Scheme
  syn region string start=/\(\\\)\@<!"/ skip=/\\[\\"]/ end=/"/
  syn match string /#\\[(){}\[\]]/

  hi clear string

  call s:racketWords()
endfunc

func! s:racketWords()
  setl lw+=
        \call-with-input-file,call-with-input-string,call-with-output-file,
        \datum->syntax,
        \fluid-let,for,
        \syntax/loc,syntax-parse,
        \tex-def-prim,
        \with-input-from-file
endfunc
