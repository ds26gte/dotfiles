"last modified 2014-09-13
"from vim.wikia.com/wiki/Encryption

au bufreadpre *.cpt call s:ccrypt_bufreadpre()

au bufreadpost *.cpt call s:ccrypt_bufreadpost()

au bufwritepre *.cpt call s:ccrypt_bufwritepre()

au bufwritepost *.cpt call s:ccrypt_bufwritepost()

func! s:ccrypt_bufreadpre()
    setl bin
    setl vi=
    setl noswf
endfunc

func! s:ccrypt_bufreadpost()
    let $crypticnonsense = inputsecret("Password: ")
    sil %!ccrypt -c -E crypticnonsense
    setl nobin
endfunc

func! s:ccrypt_bufwritepre()
    setl bin
    %!ccrypt -e -E crypticnonsense
endfunc

func! s:ccrypt_bufwritepost()
    u
    setl nobin
endfunc
