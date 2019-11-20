" last modified 2019-11-20
" Dorai Sitaram

au filetype scheme call s:racketWords()

func! s:racketWords()
  setl lw+=
        \call-with-input-file,
        \call-with-input-string,
        \call-with-output-file,
        \datum->syntax,
        \enclose-div,
        \enclose-span,
        \enclose-tag,
        \fluid-let,
        \for,
        \mstring,
        \string-append,
        \syntax-parse,
        \syntax/loc,
        \tex-def-prim,
        \with-input-from-file,
        \write-null-wrapper,
        \write-wrapper,
        \write-wrapper-scan
endfunc
