" last modified 2019-09-28
" Dorai Sitaram

" :Showswatch colordesc
" brings up a small window showing the color colordesc in four settings:
" - as fg on normal bg      (C/_),
" - as bg behind normal fg  (_/C),
" - as fg on white          (C/W),
" - as bg behind black      (B/C).

" Related map: <leader>s

" colordesc can be 
" - #RRGGBB hexadecimal (# optional)
" - a cterm (decimal) number (i.e., 0-255)
" - an X11 name

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
  let l:colorname = a:colordesc
  if l:colorname =~ '^#'
    let l:colorname = l:colorname[1:]
  endif
  if l:colorspec =~? '^[a-f0-9]\{6}$'
    let l:colorspec = '#' . l:colorspec
  elseif l:colorspec =~ '^[0-9]\{1,2}$' || l:colorspec =~ '^1[0-9]\{2}$' ||
        \l:colorspec =~ '^2[0-4][0-9]$' || l:colorspec =~ '^25[0-5]$'
    let l:colorspec = luaeval('require("ctermtorgb").ctermtorgb(' . l:colorspec . ')')
    if l:colorspec =~ '#'
      let l:colorname .= '_' .. l:colorspec[1:]
    else
      let l:colorname .= '_' .. l:colorspec
    endif
  endif
  exec 'hi def FGN' . l:colorname 'guifg=' l:colorspec
  exec 'hi def BGN' . l:colorname 'guibg=' l:colorspec
  exec 'hi def FGW' . l:colorname 'guifg=' l:colorspec 'guibg=white'
  exec 'hi def BGB' . l:colorname 'guibg=' l:colorspec 'guifg=black'
  exec 'syn match FGN' . l:colorname '"C/_ ' . l:colorname . '"'
  exec 'syn match BGN' . l:colorname '"_/C ' . l:colorname . '"'
  exec 'syn match FGW' . l:colorname '"C/W ' . l:colorname . '"'
  exec 'syn match BGB' . l:colorname '"B/C ' . l:colorname . '"'
  let l:spc = '"      "'
  exec '%!echo' l:spc
        \ 'C/_ ' . l:colorname l:spc
        \ '_/C ' . l:colorname l:spc
        \ 'C/W ' . l:colorname l:spc
        \ 'B/C ' . l:colorname
  setl nobl nomod ro
  winc p
endfunc

com! -nargs=1 Showswatch call s:showswatch(<q-args>)

nmap <leader>s :Showswatch<space>
