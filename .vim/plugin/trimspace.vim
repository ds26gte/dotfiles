" last modified 2014-11-25

au bufwritepre * call s:trimspace()

func! s:trimspace()
  norm mx

  if !&tw
    " tw == 0 for code and alpine;
    " those are the cases where we want to remove trailing spaces
    sil! %s/\s\+$//
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
