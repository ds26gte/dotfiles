" last modified 2014-12-03

au bufread,bufnewfile *.md,COMMIT_EDITMSG call s:githubOptions()

func! s:githubOptions()
  doau bufread pretend.txt

  setl mp=panhtml\ %
endfunc
