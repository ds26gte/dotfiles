" last modified 2018-08-03

com! Trimlines call s:trimlines()

func! s:trimlines()
  " don't do in diff-mode, as it could corrupt file-writes
  if &diff
    return
  endif

  norm mx

  sil! %s/\s\+$//

  " at file ends, if blank line found, collapse it with all its
  " adjacent consecutive blank lines

  sil 1 g/^$/ .,/./j

  sil $ g/^$/ ?.?,.j

  sil v/./,/./-j

  norm `x
endfunc 
