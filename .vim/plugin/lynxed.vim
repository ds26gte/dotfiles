"last change 2014-12-14

"needed only if called from within lynx

if $LYNX_VERSION == ""
  finish
endif

au bufread *.html setl noswf

let s:lynx_source_files = []

au bufenter *.html call s:txt_go_to_source_file()

func! s:txt_go_to_source_file()
  let generated_by_txt2page_p = 0
  let generated_by_pandoc_p = 0
  "check if html file was generated
  sil! 1,5g/^Generated from .\{-} by txt2page/
        \ let generated_by_txt2page_p = 1
  sil! 1,8g/<meta name="generator" content="pandoc">/
        \ let generated_by_pandoc_p = 1
  if !generated_by_txt2page_p && !generated_by_pandoc_p
    return
  endif
  "if generated, edit source file
  if generated_by_txt2page_p
    0
    /^Generated from/
    norm 2wgf
    setl mp=txt2page\ %
    doau bufread pretend.txt "shouldn't be needed!
  elseif generated_by_pandoc_p
    let l:source_file = ''
    let l:old_su = &su
    let &su .= ',.cpt,.docx,.html,.pdf,.txt\.so'
    for l:source_file_try in glob(expand('%:r') . '.*', 0, 1)
      if filereadable(l:source_file_try)
        let l:source_file = l:source_file_try
        break
      endif
    endfor
    let &su = l:old_su
    if l:source_file != ''
      exec 'e' l:source_file
      doau bufread pretend.md
      setl mp=pandoc
            \\ -f\ markdown-line_blocks-raw_html-subscript-superscript+autolink_bare_uris
            \\ -t\ html5
            \\ -c\ default.css
            \\ -s
            \\ %\ -o\ %:r.html
    endif
  endif
  "when writing source file, remember to refresh the html
  exec 'au bufwritepost' expand('%') 'call s:remember_to_refresh_html()'
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
    exec 'b' file
    lcd %:p:h
    make
  endfor
endfunc
