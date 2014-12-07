" last modified 2014-12-05

au bufwritepre * call s:trimspace()

func! s:trimspace()
  norm mx

  if !&tw
    " for code, remove all trailing spaces
    sil! %s/\s\+$//
    " for text, typog.vim takes over
  endif

  " if last line blank, tack on bogus nonblank line
  sil $ g/^$/ s/^$/\r@trimspace-last-line@/

  " from top, if blank line found, collapse it with all its
  " subsequent consecutive blank lines
  sil v/./,/./-j

  " if first line blank, delete it
  sil 1 g/^$/d

  " if last line bogus, delete it and immediately preceding line
  sil $ g/^@trimspace-last-line@$/ $-1,$d

  sil! norm `x
endfunc
