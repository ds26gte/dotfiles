"last modified 2014-10-22

au bufread,bufnewfile *.css call s:css_options()

func! s:css_options()
    setl tw=0
    setl cin

    syn match string "#[0-9a-fA-F]\{3}\%([0-9a-fA-F]\)\@!"
    syn match string "#[0-9a-fA-F]\{6}\%([0-9a-fA-F]\)\@!"
endfunc
