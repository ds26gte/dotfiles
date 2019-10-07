" last modified 2019-10-07
" Dorai Sitaram

func! s:noTrailingSpaces()
  norm mx
  %s/\s\+$//
  norm `x
endfunc

func! s:trimlines()
  " don't do in diff-mode as it could corrupt file-writes
  if &diff
    return
  endif

  norm mx

  " remove spaces at ends of lines
  %s/\s\+$//

  " remove blank lines at end of file
  1 g/^$/ .,/./j

  " remove blank lines at beginning of file
  $ g/^$/ ?.?,.j

  " collapse consecutive blank lines in mid file
  v/./,/./-j

  norm `x
endfunc 

com! NoTrailingSpaces sil! call s:noTrailingSpaces()

com! Trimlines sil! call s:trimlines()
