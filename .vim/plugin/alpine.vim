"last modified 2014-11-06

au bufread,bufnewfile /tmp/pico.* call s:alpine_options()

au bufwritepre /tmp/pico.* call SmartQuotes()

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
