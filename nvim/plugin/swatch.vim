" last modified 2019-10-19
" Dorai Sitaram

" :Showswatch colordesc
" brings up a small window showing the color colordesc in four settings:
" - as fg on normal bg      (C/_),
" - as fg on white          (C/W),
" - as fg on black          (C/B),
" - as bg behind normal fg  (_/C),
" - as bg behind white      (W/C),
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
    exec '2sp' l:swatchfile
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
  exec 'hi def BGN_FG' . l:colorname 'guifg=' l:colorspec
  exec 'hi def BGW_FG' . l:colorname 'guifg=' l:colorspec 'guibg=white'
  exec 'hi def BGB_FG' . l:colorname 'guifg=' l:colorspec 'guibg=black'
  exec 'hi def FGN_BG' . l:colorname 'guibg=' l:colorspec
  exec 'hi def FGW_BG' . l:colorname 'guibg=' l:colorspec 'guifg=white'
  exec 'hi def FGB_BG' . l:colorname 'guibg=' l:colorspec 'guifg=black'
  exec 'syn match BGN_FG' . l:colorname '"C/_ ' . l:colorname . '"'
  exec 'syn match BGW_FG' . l:colorname '"C/W ' . l:colorname . '"'
  exec 'syn match BGB_FG' . l:colorname '"C/B ' . l:colorname . '"'
  exec 'syn match FGN_BG' . l:colorname '"_/C ' . l:colorname . '"'
  exec 'syn match FGW_BG' . l:colorname '"W/C ' . l:colorname . '"'
  exec 'syn match FGB_BG' . l:colorname '"B/C ' . l:colorname . '"'
  let l:spc = '"    "'
  exec '%!echo' 
        \ 'C/_ ' . l:colorname l:spc
        \ 'C/W ' . l:colorname l:spc
        \ 'C/B ' . l:colorname '; echo'
        \ '_/C ' . l:colorname l:spc
        \ 'W/C ' . l:colorname l:spc
        \ 'B/C ' . l:colorname
  setl nobl nomod ro
  winc p
endfunc

com! -nargs=1 Showswatch call s:showswatch(<q-args>)

nmap <leader>s :Showswatch<space>
