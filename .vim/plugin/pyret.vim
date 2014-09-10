"last modified 2014-09-09

au bufread,bufnewfile ~/src/pyret-lang/** call s:pyret_options()

func! s:pyret_options()
  setl sua+=.js,.arr
  setl mp=cd\ ~/src/pyret-lang;make

  setl path=.
        \,~/src/pyret-lang/src/js/base
        \,~/src/pyret-lang/src/js/trove
        \,~/src/pyret-lang/tests/pyret/tests
endfunc

au bufwritepost ~/src/pyret-lang/**/*.{js,arr} make
