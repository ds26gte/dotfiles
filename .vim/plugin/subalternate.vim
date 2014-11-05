"last modified 2014-11-05

func! SubAlternate(...)
  if !exists('b:subAlternateP')
    let b:subAlternateP = 1
  endif
  if a:0
    let b:subAlternateP = 1
  else
    let b:subAlternateP = !b:subAlternateP
    return b:subAlternateP
  endif
endfunc
