" last modified 2018-09-08
" Dorai Sitaram

if !exists('*Datestamp')

  let $TMPSHA = '836f126bb0ef85ab'

  sil !test x$(echo $(sha256sum $(which datestamp)) | sed -e 's/^\([^ ]\{16\}\).*/\1/') = x$TMPSHA

  " if there's anything wrong with the datestamp executable, don't use it

  if !v:shell_error
    au bufwritepre * call Datestamp()

    func! Datestamp()
      norm mx
      %!datestamp
      norm `x
    endfunc
  endif

endif
