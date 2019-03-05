" last modified 2019-03-12
" Dorai Sitaram

" Showswatch colordesc
" brings up a small window showing the color colordesc in four settings:
" - as fg on normal bg,
" - as bg behind normal fg,
" - as fg on white,
" - as bg behind black.
" colordesc can be #RRGGBB (# optional) or an X11 name

func! s:showswatch(colordesc)
  let l:swatchfile = split(&bdir, ',')[-1] . '/view.swatch.tmp.1'
  if bufexists(l:swatchfile)
    exec 'sb' l:swatchfile
    setl noro
  else
    exec '1sp' l:swatchfile
    setl wfh
    winc J
  endif
  let l:colorspec = a:colordesc
  if l:colorspec =~? '^[a-f0-9]\{6}$'
    let l:colorspec = '#' . l:colorspec
  endif
  let l:colorname = l:colorspec
  if l:colorname =~ '^#'
    let l:colorname = l:colorname[1:]
  endif
  let l:colorspececho = l:colorspec
  if l:colorspec =~ '^#'
    let l:colorspececho = '\\' . l:colorspec
  endif
  exec 'hi def FGN' . l:colorname 'guifg=' l:colorspec
  exec 'hi def BGN' . l:colorname 'guibg=' l:colorspec
  exec 'hi def FGW' . l:colorname 'guifg=' l:colorspec 'guibg=white'
  exec 'hi def BGB' . l:colorname 'guibg=' l:colorspec 'guifg=black'
  exec 'syn match FGN' . l:colorname '"i ' . l:colorspec . '"'
  exec 'syn match BGN' . l:colorname '"ii ' . l:colorspec . '"'
  exec 'syn match FGW' . l:colorname '"iii ' . l:colorspec . '"'
  exec 'syn match BGB' . l:colorname '"iv ' . l:colorspec . '"'
  let l:spc = '"      "'
  exec '%!echo' l:spc
        \ 'i' l:colorspececho l:spc
        \ 'ii' l:colorspececho l:spc
        \ 'iii' l:colorspececho l:spc
        \ 'iv' l:colorspececho
  setl nobl nomod ro
  winc p
endfunc

com! -nargs=1 Showswatch call s:showswatch(<q-args>)

nmap <leader>s :Showswatch<space>
