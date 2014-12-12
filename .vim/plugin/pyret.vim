"last modified 2014-12-10

au bufread,bufnewfile ~/public_html/pyret-lang*/** call s:pyretOptions()

func! s:pyretOptions()
  "setl sua+=.js,.arr

  setl path=.
        \,~/public_html/pyret-lang/src/js/base
        \,~/public_html/pyret-lang/src/js/trove
        \,~/public_html/pyret-lang/lib/js-numbers/src
        \,~/public_html/pyret-lang/tests/pyret/tests
        \,~/public_html/pyret-lang/src/arr/base
        \,~/public_html/pyret-lang/docs/written/trove
        \,~/public_html/pyret-lang.wiki
endfunc

au bufread,bufnewfile ~/public_html/pyret-lang/**/*.{arr,js} call s:pyretJsOptions()

func! s:pyretJsOptions()
  setl mp=cd\ ~/public_html/pyret-lang;make
endfunc

au bufread,bufnewfile ~/public_html/pyret-lang/docs/written/**.scrbl call s:pyretScrblOptions()

func! s:pyretScrblOptions()
  setl mp=cd\ ~/public_html/pyret-lang/docs/written;make
endfunc

au bufwritepost ~/public_html/pyret-lang/**/*.{arr,js,scrbl} make | redraw
