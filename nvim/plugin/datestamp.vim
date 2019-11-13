" last modified 2019-10-26
" Dorai Sitaram

au bufwritepre * call Datestamp()

func! Datestamp()
  " mark current cursor position in file
  norm my

  " move cursor to a well-defined spot on the screen, say line N from top
  " (unless you're near either end of file, this will be exactly midscreen)
  norm M

  " mark new cursor position in file
  norm mz

  " variable for storing line number of first YYYY-MM-DD -style datestamp
  let l:hyphenedDatestampLine = 0

  " ditto, for YYYYMMDD -style datestamp
  let l:unhyphenedDatestampLine = 0

  " move to EOF, because searching from BOF misses crucial first line,
  " which is a popular place for datestamps!
  $

  " find first occurrence of YYYY-MM-DD line, if any
  sil! /\c^.*last\s\+\%(change\|modified\|update\)\&^.*\<\d\{4}[-]\d\{2}[-]\d\{2}\>/
        \ g// let l:hyphenedDatestampLine = line('.')

  " similarly, find first occurrence of YYYYMMDD line, if any
  $
  sil! /\c^.*last\s\+\%(change\|modified\|update\)\&^.*\<\d\{8}\>/
        \ g// let l:unhyphenedDatestampLine = line('.')

  " whichever of the two is earlier, modify that datestamp to today
  if l:hyphenedDatestampLine &&
        \ (!l:unhyphenedDatestampLine ||
        \ (l:hyphenedDatestampLine < l:unhyphenedDatestampLine))
    exec l:hyphenedDatestampLine
    sil! s/\<\d\{4}[-]\d\{2}[-]\d\{2}\>/\=strftime('%Y-%m-%d')/
  elseif l:unhyphenedDatestampLine
    exec l:unhyphenedDatestampLine
    sil! s/\<\d\{8}\>/\=strftime('%Y%m%d')/
  endif

  " jump to position mark z
  norm 'z

  " reposition screen so cursor is on previously calculated line N from top.
  " this makes screen look exactly as it was before we started
  norm z.

  " but the cursor may still not be at original position; so move it!
  norm `y
endfunc
