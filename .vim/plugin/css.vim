" last modified 2014-12-14

au bufread,bufnewfile *.css call s:cssOptions()

func! s:cssOptions()
    setl cin
    setl tw=0

    syn match string "#[0-9a-fA-F]\{3}\%([0-9a-fA-F]\)\@!"
    syn match string "#[0-9a-fA-F]\{6}\%([0-9a-fA-F]\)\@!"
endfunc
