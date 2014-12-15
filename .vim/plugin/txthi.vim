" last modified 2014-12-14

func! TxtHilite()
  " URLs
  syn match title '\<[[:alpha:]-]\+://[^[:space:]()<>]\+\%([[:punct:]⟩]\)\@<!\%(([[:alnum:]]\+)\|/\|\)'
  syn match title '\<mailto:[[:alnum:].]\+@[[:alnum:]]\+\.[[:alpha:]]\+\>'
  syn match title '\<[[:alnum:].-]\+\.\%(biz\|com\|co\.[[:lower:]]\{2}\|edu\|net\|org\|\%([[:lower:]]\{2}\)\)\%(js\|on\)\@<!\%(/[^[:space:]()<>]\+\%([[:punct:]]\)\@<!\%(([[:alnum:]]\+)\|/\|\)\|\>\)'
  syn match title '\<[[:alnum:].]\+@[[:alnum:].]\+\.\%(ca\|com\|edu\|in\|net\|org\|us\)\>'

  " pathnames starting with ./
  syn match title '"\./.\{-}"'
  syn match title '“\./.\{-}”'
  syn match title '\./[^[:space:]()<>&]\+\%([[:punct:]]\)\@<!'

  " headers
  syn match title '^#\+\s.*'

  " emphasis
  syn match title '⎈.\{-}⎈'

  " footnotes
  syn match title '(†[^()[:space:]]*)'
  syn region title start='(†[^)]*\($\|[[:space:](]\)' end='†)'

  " code display
  syn region title start='^\s*```[^`]*$' end='^\s*````\s*$'

  " email quote
  if expand('%:t') =~ '^pico\.\d\+$d'
    syn region comment oneline start='^>' end='$'
  endif
endfunc
