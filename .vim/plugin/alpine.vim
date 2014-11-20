"last modified 2014-11-20

au bufread,bufnewfile /tmp/pico.* call s:alpine_options()

func! s:alpine_options()
  setl co=72
  setl lbr
  setl nu
  setl sbr=
  setl tw=0

  nn k gk
  nn j gj

  nn gk k
  nn gj j

  syn region comment oneline start="^>" end="$"
endfunc
