" last modified 2019-10-06
" Dorai Sitaram

" from www.noah.org/wiki/Password_Safe_with_Vim_and_OpenSSL
" but (a) with ui more like vim's :X, and
"     (b) only for .aes

if empty($INSCRUTABLE)
  finish
endif

" $INSCRUTABLE must be set to an openssl call of your choice
" with options except: -e/-d, -pass, and -in

au bufreadpre,filereadpre *.aes call s:opqReadPre()

au bufreadpost,bufnewfile,filereadpost *.aes call s:opqReadPost()

" but file{read,write}{pre,post} settings don't really seem to work

func! s:opqReadPre()
  set cb=
  set secure
  set vi=
  set sd=
  setl noswf
  exec 'set bsk+=*.' . expand('%:e')
  au bufwritepre,filewritepre <buffer> call s:opqWritePre()
  au bufwritepost,filewritepost <buffer> call s:opqWritePost()
  let s:crypticNonsense = inputsecret('Password: ')
endfunc

func! s:opqReadPost()
  if !exists('s:crypticNonsense')
    call s:opqReadPre()
  endif
  if !(line('$') == 1 && getline(1) == '')
    "i.e., file isn't empty
    setl ul=-1
    %d
    set nostmp
    let $crypticNonsense = s:crypticNonsense
    sil! %!$INSCRUTABLE -d -pass env:crypticNonsense -in %
    let $crypticNonsense = 0
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
    redraw!
  endif
  exec 'do bufreadpost' expand('%:r')
endfunc

func! s:opqWritePre()
  set nostmp
  let $crypticNonsense = s:crypticNonsense
  sil! %!$INSCRUTABLE -e -pass env:crypticNonsense
  let $crypticNonsense = 0
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
  setl nomod
  redraw!
endfunc

func! ChangePassword()
  if exists('s:crypticNonsense')
    let s:crypticNonsense = inputsecret('New password: ')
    w
  else
    echo 'Not an inscrutable file'
  endif
endfunc
