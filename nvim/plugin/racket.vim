" last modified 2019-09-17
" Dorai Sitaram

au filetype scheme,lisp call s:racketOptions()

func! s:racketOptions()
  "this is so matchit & match-up work correctly for Scheme
  syn region string start=/\(\\\)\@<!"/ skip=/\\[\\"]/ end=/"/
  syn match string /#\\[(){}\[\]]/

  call s:racketWords()
endfunc

func! s:racketWords()
  setl lw+=
        \call-with-input-file,
        \call-with-input-string,
        \call-with-output-file,
        \datum->syntax,
        \fluid-let,
        \for,
        \syntax-parse,
        \syntax/loc,
        \tex-def-prim,
        \with-input-from-file,
        \write-null-wrapper,
        \write-wrapper,
        \write-wrapper-scan
endfunc
