"last modified 2014-11-04

au bufread,bufnewfile ~/public_html/pyret-lang*/** call s:pyret_options()

func! s:pyret_options()
  setl sua+=.js,.arr

  setl path=.
        \,~/public_html/pyret-lang/src/js/base
        \,~/public_html/pyret-lang/src/js/trove
        \,~/public_html/pyret-lang/tests/pyret/tests
        \,~/public_html/pyret-lang/src/arr/base
        \,~/public_html/pyret-lang/docs/written/trove
        \,~/public_html/pyret-lang.wiki
endfunc

au bufread,bufnewfile ~/public_html/pyret-lang/**/*.js call s:pyret_js_options()

func! s:pyret_js_options()
  setl mp=cd\ ~/public_html/pyret-lang;make
endfunc

au bufread,bufnewfile ~/public_html/pyret-lang/docs/written/**/*.scrbl call s:pyret_scrbl_options()

func! s:pyret_scrbl_options()
  setl mp=cd\ ~/public_html/pyret-lang/docs/written;make
endfunc

"au bufwritepost ~/public_html/pyret-lang/**/*.{arr,js} make
