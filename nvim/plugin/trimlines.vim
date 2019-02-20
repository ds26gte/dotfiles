" last modified 2019-02-21

func! s:noTrailingSpaces()
  norm mx
  %s/\s\+$//
  norm `x
endfunc

func! s:trimlines()
  " don't do in diff-mode, as it could corrupt file-writes
  if &diff
    return
  endif

  norm mx

  %s/\s\+$//

  " at file ends, if blank line found, collapse it with all its
  " adjacent consecutive blank lines

  1 g/^$/ .,/./j

  $ g/^$/ ?.?,.j

  v/./,/./-j

  norm `x
endfunc 

com! NoTrailingSpaces sil! call s:noTrailingSpaces()

com! Trimlines sil! call s:trimlines()
