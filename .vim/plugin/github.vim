" last modified 2014-12-08

au bufread,bufnewfile *.md,COMMIT_EDITMSG call s:github_options()

func! s:github_options()
  doau bufread pretend.txt
  setl mp=pandoc
        \\ -f\ markdown-line_blocks-raw_html-subscript-superscript+autolink_bare_uris
        \\ -t\ html5
        \\ -c\ default.css
        \\ -s
        \\ %\ -o\ %:r.html
endfunc

au bufread,bufnewfile COMMIT_EDITMSG setl mp=''
