"last modified 2014-10-05

au bufread,bufnewfile ~/public_html/pyret-lang/** call s:pyret_options()

func! s:pyret_options()
  setl sua+=.js,.arr
  setl mp=cd\ ~/public_html/pyret-lang;make

  setl path=.
        \,~/public_html/pyret-lang/src/js/base
        \,~/public_html/pyret-lang/src/js/trove
        \,~/public_html/pyret-lang/tests/pyret/tests
        \,~/public_html/pyret-lang/src/arr/base
endfunc

au bufwritepost ~/public_html/pyret-lang/**/*.{js,arr} make
