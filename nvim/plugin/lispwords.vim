" last modified 2019-11-25
" Dorai Sitaram

au filetype lisp,scheme call s:lispwords()

func! s:lispwords()
  setl lw+=
        \call-with-input-file,
        \call-with-input-string,
        \call-with-input-string/buffered,
        \call-with-lazy-image-stream,
        \call-with-output-file,
        \concatenate,
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
        \with-open-file,
        \write-null-wrapper,
        \write-wrapper,
        \write-wrapper-scan
endfunc
