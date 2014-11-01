"last modified 2014-10-31

au bufread,bufnewfile /tmp/pico.* call s:alpine_options()

func! s:alpine_options()
  setl tw=0
  setl lbr
  setl sbr=·

  nn k gk
  nn j gj

  syn region comment oneline start="^>" end="$"
endfunc
