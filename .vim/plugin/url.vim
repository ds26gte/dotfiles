"last modified 2014-09-18

au bufread,bufnewfile * call s:recognize_urls()

func! s:recognize_urls()
    syn match title "\<[[:alpha:]-]\+://[^[:space:]()<>]\+\%([[:punct:]]\)\@<!\%(([[:alnum:]]\+)\|/\|\)"
    syn match title "\<mailto:[[:alnum:].]\+@[[:alnum:]]\+\.[[:alpha:]]\+\>"
    syn match title "\<[[:alnum:].-]\+\.\%(biz\|com\|co\.[[:lower:]]\{2}\|edu\|net\|org\|\%([[:lower:]]\{2}\)\)\%(js\|on\)\@<!\%(/[^[:space:]()<>]\+\%([[:punct:]]\)\@<!\%(([[:alnum:]]\+)\|/\|\)\|\>\)"
    syn match title "\<[[:alnum:].]\+@[[:alnum:].]\+\.\%(ca\|com\|edu\|in\|net\|org\|us\)\>"

    "pathnames starting with ./
    syn match title "\"\./.\{-}\""
    syn match title "\./[^[:space:]()<>&]\+\%([[:punct:]]\)\@<!"
endfunc
