" last modified 2019-10-26
" Dorai Sitaram

" needed only if called from within (text-based) browser

if $W3M_FILENAME == '' && $LYNX_VERSION == ''
  finish
endif

let s:adocSourceFilesThatMustBeHTMLed = []

au bufenter *.html call s:goToSourceFile()

func! s:goToSourceFile()
  let l:generatedByAsciidoctorP = 0
  " check if html file was generated
  sil! 1,8g/^<meta name="generator" content="Asciidoctor.\{-}">/
        \ let l:generatedByAsciidoctorP = 1
  if !l:generatedByAsciidoctorP
    return
  else
    let l:adoccmd = 'adockindle'
    sil! 1,10g/^<link.*fonts\.googleapis\.com/
          \ let l:adoccmd = 'asciidoctor'
  endif
  " if generated, edit source file
  let l:sourceFile = ''
  for l:sourceFileTry in glob(expand('%:r') . '.[at]*', 0, 1)
    " look only at extensions that match [at]*, e.g,
    " ad[oc], asc[iidoc], t[e]xt
    if fnamemodify(l:sourceFileTry, ':e') =~ '^.[^desx]\|^..[^cotx]\|[^cdt]$'
      " but weed out ?[^desx]*, ??[^cotx], *[^cdt], e.g.,
      " afm, arr, tar, test, tex[i[nfo]], tgz, tmac, toc, tr[off], ttf
      continue
    endif
    if filereadable(l:sourceFileTry)
      let l:sourceFile = l:sourceFileTry
      break
    endif
  endfor
  if l:sourceFile != ''
    exec 'e' l:sourceFile
    setf asciidoc
    exec 'setl mp=' . l:adoccmd . '\ %'
    " when writing source file, remember to refresh the html
    exec 'au bufwritepost' expand('%') 'call s:rememberToRefreshHTML()'
  endif
endfunc

func! s:rememberToRefreshHTML()
  let thisFile = expand('%:p')
  if index(s:adocSourceFilesThatMustBeHTMLed, thisFile) < 0
    call add(s:adocSourceFilesThatMustBeHTMLed, thisFile)
  endif
endfunc

au vimleave * call s:backToBrowser()

func! s:backToBrowser()
  for file in s:adocSourceFilesThatMustBeHTMLed
    exec 'b' file
    lcd %:p:h
    make
  endfor
endfunc
