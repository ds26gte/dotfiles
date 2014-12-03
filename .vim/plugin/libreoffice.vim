" last modified 2014-12-03

au bufread,bufnewfile *.wd call s:libreOfficeOptions()

func! s:libreOfficeOptions()
  doau bufread pretend.txt

  setl mp=pandoc\ -f\ markdown-line_blocks-raw_html-subscript-superscript+autolink_bare_uris\ %\ -o\ %:r.docx
endfunc

au bufwritepost *.wd make
