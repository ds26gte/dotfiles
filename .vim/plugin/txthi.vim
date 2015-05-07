" last modified 2015-05-07

func! TxtHilite()

  " URLs
  syn match url '\<[[:alpha:]-]\+://[^[:space:]()<>]\+\%([[:punct:]⟩]\)\@<!\%(([[:alnum:]]\+)\|/\|\)'
  syn match url '\<mailto:[[:alnum:].]\+@[[:alnum:]]\+\.[[:alpha:]]\+\>'
  syn match url '\<[[:alnum:].-]\+\.\%(biz\|com\|co\.[[:lower:]]\{2}\|edu\|net\|org\|[[:lower:]]\{2}\%(js\|on\)\@<!\)\%(/[^[:space:]()<>]\+\%([[:punct:]]\)\@<!\%(([[:alnum:]]\+)\|/\|\)\|\>\)'
  syn match url '\<[[:alnum:].]\+@[[:alnum:].]\+\.\%(ca\|com\|edu\|in\|net\|org\|us\)\>'

  " pathnames starting with ./
  syn match url '"\./.\{-}"'
  syn match url '“\./.\{-}”'
  syn match url '\./[^[:space:]()<>&]\+\%([[:punct:]]\)\@<!'

  " headers
  syn match header '^#\+\s.*'
  syn match header '^\.=\+\s.*'

  " emphasis
  syn match title '⎈.\{-}⎈'

  " quote

  syn region quoted start='‹‹‹' end='›››'

  " footnotes
  syn match title '(†[^()[:space:]]*)'
  syn region title start='(†[^)]*\($\|[[:space:](]\)' end='†)'

  syn region title start='^\.FS' end='^\.FE'

  " code display
  syn region title start='^\.\?\s*```[^`]*$' end='^\.\?\s*````\?\s*$'

  " email quote
  if expand('%:t') =~ '^pico\.\d\+$d'
    syn region comment oneline start='^>' end='$'
  endif
endfunc
