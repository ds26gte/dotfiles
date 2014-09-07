"last modified 2014-09-07

au bufread,bufnewfile ~/src/pyret-lang/** call s:pyret_options()

func! s:pyret_options()
  setl sua+=.js,.arr

  setl path=.
        \,~/src/pyret-lang/src/js/base
        \,~/src/pyret-lang/src/js/trove
        \,~/src/pyret-lang/tests/pyret/tests
endfunc
