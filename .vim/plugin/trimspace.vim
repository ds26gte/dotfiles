" last modified 2014-11-30

au bufwritepre * call s:trimspace()

func! s:trimspace()
  norm mx

  if !&tw
    " &tw is 0 for code and email;
    " remove trailing spaces for them
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
