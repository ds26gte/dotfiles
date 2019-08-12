" last modified 2019-08-30
" from www.noah.org/wiki/Password_Safe_with_Vim_and_OpenSSL
" but (a) with ui more like vim's :X, and
" (b) only for .aes

au bufreadpre,filereadpre *.aes call s:opqReadPre()

au bufreadpost,filereadpost *.aes call s:opqReadPost()

au bufwritepre,filewritepre *.aes call s:opqWritePre()

au bufwritepost,filewritepost *.aes call s:opqWritePost()

au bufnewfile *.aes call s:opqNewFile()

func! s:opqSetOptions()
  set cb=
  set secure
  set vi=
  set sd=
  setl noswf
  exec 'set bsk+=*.' . expand('%:e')
endfunc

func! s:opqNewFile()
  call s:opqSetOptions()
  let s:crypticNonsense = inputsecret('Password: ')
endfunc

func! s:opqReadPre()
  call s:opqSetOptions()
  setl bin
endfunc

func! s:opqReadPost()
  setl ul=-1
  let s:crypticNonsense = inputsecret('Password: ')
  %d
  exec 'norm i' . s:crypticNonsense
  set nostmp
  sil! %!openssl aes-256-cbc -md sha256 -a -d -salt -pass stdin -in %
  set stmp&
  setl ul&
  redraw!
  if v:shell_error
    sil! u
    redraw!
    echo 'Error: could not decrypt'
    echo 'Press any key to continue...'
    call getchar()
    return
  endif
  setl nobin
  exec 'do bufreadpost' expand('%:r')
  redraw!
endfunc

func! s:opqWritePre()
  setl bin
  sil! 0go
  sil! exec 'norm i' . s:crypticNonsense . "\n"
  set nostmp
  sil! %!openssl aes-256-cbc -md sha256 -a -e -salt -pass stdin
  set stmp&
  redraw!
  if v:shell_error
    sil! u
    redraw!
    echo 'Error: could not encrypt'
    echo 'Press any key to continue...'
    call getchar()
    return
  endif
endfunc

func! s:opqWritePost()
  sil! u
  setl nobin
  setl nomod
  redraw!
endfunc

func! ChangePassword()
  let s:crypticNonsense = inputsecret('New password: ')
endfunc
