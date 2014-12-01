" last modified 2014-12-01

au bufread,bufnewfile *.wd call s:libreOfficeOptions()

func! s:libreOfficeOptions()
  setl mp=pandoc\ -f\ markdown-line_blocks-raw_html-subscript-superscript+autolink_bare_uris\ %\ -o\ %:r.docx
  setl tw=65

  call TxtHilite()
endfunc

au bufwritepre *.wd call TypographicNiceties()

au bufwritepost *.wd make
