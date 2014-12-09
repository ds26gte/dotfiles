" last modified 2014-12-08

au bufread,bufnewfile *.lo call s:libreOfficeOptions()

func! s:libreOfficeOptions()
  doau bufread pretend.txt

  setl mp=pandoc
        \\ -f\ markdown-line_blocks-raw_html-subscript-superscript+autolink_bare_uris
        \\ %\ -o\ %:r.docx
endfunc
