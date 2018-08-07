" last modified 2018-05-12

setl list
setl wm=1

" make text flow according to rfc 3676

au bufwritepre <buffer> sil! call s:makeTextFlow()

func! s:makeTextFlow()
  norm mx

  " no need for more than one trailing space
  %s/ \{2,}$/ /

  " flushleft line not already ending in space should add it
  g/^[^ >]/ s/[^ ]$/& /

  " nonflushleft line should lose trailing space
  g/^ / s/ \+$//

  " its previous line should lose trailing space too
  g/^ / -1s/ \+$//

  " line with just space becomes blank
  g/^ \+$/ s/ \+$//

  " its preceding line should lose trailing space
  g/^$/ -1s/ \+$//

  let l:sigSepFound = 0

  " final dashdash signals signature and should have trailing space
  $
  while 1
    if match(getline('.'), '^-- *$') != -1
      if !l:sigSepFound
        s/^-- *$/-- /
        let l:sigSepFound = 1
      else
        s/^-- *$/--/
      endif
    endif
    if line('.') > 1
      norm k
    else
      break
    endif
  endwhile

  " no trailing spaces for signature
  if l:sigSepFound
    sil! /^-- $/+1,$ v/^>/ s/ \+$//
  endif

  " last line loses trailing space
  $ s/ \+$//

  sil! norm `x
endfunc
