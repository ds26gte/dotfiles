"last modified 2014-09-03

au bufread,bufnewfile ~/src/pyret-lang/** call s:pyret_options()

func! s:pyret_options()
  setl path=.
  setl sua+=.js,.arr

  setl path+=~/src/pyret-lang/src/js/base
  setl path+=~/src/pyret-lang/src/js/trove
  setl path+=~/src/pyret-lang/tests/pyret/tests
endfunc
