" last modified 2019-10-15
" Dorai Sitaram

au filetype scheme,lisp call s:racketOptions()

func! s:racketOptions()
  call Identify_string('"')
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
        \string-append,
        \syntax-parse,
        \syntax/loc,
        \tex-def-prim,
        \with-input-from-file,
        \write-null-wrapper,
        \write-wrapper,
        \write-wrapper-scan
endfunc
