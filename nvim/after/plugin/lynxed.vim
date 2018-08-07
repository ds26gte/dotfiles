" Last change 2017-12-17
" Dorai Sitaram

" Needed only if called from within lynx

if $LYNX_VERSION == ""
  finish
endif

let s:adoc_source_files_that_must_be_htmled = []

au bufenter *.html call s:txt_go_to_source_file()

func! s:txt_go_to_source_file()
  let generated_by_asciidoctor_p = 0
  " check if html file was generated
  sil! 1,8g/^<meta name="generator" content="Asciidoctor.\{-}">/
        \ let generated_by_asciidoctor_p = 1
  if !generated_by_asciidoctor_p
    return
  endif
  " if generated, edit source file
  let l:source_file = ''
  for l:source_file_try in glob(expand('%:r') . '.[at]*', 0, 1)
    " look only at extensions that match [at]*, e.g,
    " ad[oc], asc[iidoc], t[e]xt
    if fnamemodify(l:source_file_try, ':e') =~ '^.[^desx]\|^..[^cotx]\|[^cdt]$'
      " but weed out ?[^desx]*, ??[^cotx], *[^cdt], e.g.,
      " afm, arr, tar, test, tex[i[nfo]], tgz, tmac, toc, tr[off], ttf
      continue
    endif
    if filereadable(l:source_file_try)
      let l:source_file = l:source_file_try
      break
    endif
  endfor
  if l:source_file != ''
    exec 'e' l:source_file
    setf asciidoc
    setl mp=adockindle\ %
    " when writing source file, remember to refresh the html
    exec 'au bufwritepost' expand('%') 'call s:remember_to_refresh_html()'
  endif
endfunc

func! s:remember_to_refresh_html()
  let this_file = expand('%:p')
  if index(s:adoc_source_files_that_must_be_htmled, this_file) < 0
    call add(s:adoc_source_files_that_must_be_htmled, this_file)
  endif
endfunc

au vimleave * call s:back_to_lynx()

func! s:back_to_lynx()
  for file in s:adoc_source_files_that_must_be_htmled
    exec 'b' file
    lcd %:p:h
    make
  endfor
endfunc
