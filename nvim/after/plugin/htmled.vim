" last modified 2020-02-05
" created < 2015-11
" Dorai Sitaram

" needed only if called from Lynx

if $LYNX_VERSION == ''
  finish
endif

au bufenter *.html,*.shtml call s:gotoSrcFile()

func! s:gotoSrcFile()
  let l:generatedByAdoc = 0
  " check if html file was generated
  sil! 1,8g/^<meta name="generator" content="Asciidoctor.\{-}">/
        \ let l:generatedByAdoc = 1
  if !l:generatedByAdoc
    return
  endif
  " if generated, edit source file
  let l:srcFile = ''
  for l:candidateFile in glob(expand('%:r') . '.[at]*', 0, 1)
    " look only at extensions that match [at]*, e.g,
    " ad[oc], asc[iidoc], t[e]xt
    if fnamemodify(l:candidateFile, ':e') =~ '^.[^desx]\|^..[^cotx]\|[^cdt]$'
      " but weed out ?[^desx]*, ??[^cotx], *[^cdt], e.g.,
      " afm, arr, tar, test, tex[i[nfo]], tgz, tmac, toc, tr[off], ttf
      continue
    endif
    if filereadable(l:candidateFile)
      let l:srcFile = l:candidateFile
      break
    endif
  endfor
  if l:srcFile != ''
    exec 'e' l:srcFile
    setf asciidoc
  endif
endfunc
