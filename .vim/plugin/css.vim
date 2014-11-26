"last modified 2014-11-25

au bufread,bufnewfile *.css call s:css_options()

func! s:css_options()
    setl cin

    syn match string "#[0-9a-fA-F]\{3}\%([0-9a-fA-F]\)\@!"
    syn match string "#[0-9a-fA-F]\{6}\%([0-9a-fA-F]\)\@!"
endfunc
