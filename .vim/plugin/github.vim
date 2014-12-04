" last modified 2014-12-04

au bufread,bufnewfile *.md,COMMIT_EDITMSG call s:githubOptions()

func! s:githubOptions()
  doau bufread pretend.txt

  setl mp=pandoc
        \\ -f\ markdown-line_blocks-raw_html-subscript-superscript+autolink_bare_uris
        \\ -t\ html5
        \\ -c\ default.css
        \\ -s
        \\ %\ -o\ %:r.html
endfunc
