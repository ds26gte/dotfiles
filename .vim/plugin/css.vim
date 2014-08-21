"last modified 2014-08-21

au bufread,bufnewfile *.css call s:css_options()

func! s:css_options()
    setl tw=0
    setl cin

    syn match title "#[0-9a-fA-F]\{3}\%([0-9a-fA-F]\)\@!"
    syn match title "#[0-9a-fA-F]\{6}\%([0-9a-fA-F]\)\@!"
endfunc
