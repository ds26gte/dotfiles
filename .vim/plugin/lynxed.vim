"last change 2014-10-17

"needed only if called from within lynx

if $LYNX_VERSION == ""
  finish
endif

let s:lynx_source_files = []

au bufenter *.html call s:txt_go_to_source_file()

func! s:txt_go_to_source_file()
  let generated_by_txt2page_p = 0
  let generated_by_pandoc_p = 0
  "determine if html file was generated
  1,5g/^Generated from .\{-} by txt2page/
        \ let generated_by_txt2page_p = 1
  1,5g/^Generated from .\{-} by pandoc/
        \ let generated_by_pandoc_p = 1
  if !generated_by_txt2page_p && !generated_by_pandoc_p
    return
  endif
  "if generated, edit source file
  0
  /^Generated from/
  norm 2wgf
  if generated_by_txt2page_p
    setl mp=txt2page\ %
  elseif generated_by_pandoc_p
    setl mp=panhtml\ %
  endif
  "when writing source file, refresh the html
  let this_file = expand('%')
  exec 'au bufwritepost ' . this_file . ' call s:remember_to_refresh_html()'
endfunc

func! s:remember_to_refresh_html()
  let this_file = expand('%:p')
  if index(s:lynx_source_files, this_file) < 0
    call add(s:lynx_source_files, this_file)
  endif
endfunc

au vimleave * call s:back_to_lynx()

func! s:back_to_lynx()
  for file in s:lynx_source_files
    exec 'b ' . file
    lcd %:p:h
    make
  endfor
endfunc
