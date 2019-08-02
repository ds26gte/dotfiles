" last modified 2019-07-28
" Dorai Sitaram

func! s:ensurePlugin(repo)
  let l:pkgname = fnamemodify(a:repo, ":t")
  let l:vimdir = split(&rtp, ',')[0]
  let l:pkgsdir = l:vimdir . '/pack/3rdpartyplugins/start'
  let l:pkgdir = l:pkgsdir . '/' . l:pkgname
  if empty(finddir(l:pkgdir))
    call mkdir(l:pkgdir, 'p')
    sil exec '!cd' l:pkgsdir '; git clone' a:repo
  endif
endfunc

com! -nargs=1 Plugin call s:ensurePlugin(<q-args>)

com! -nargs=1 GHplugin Plugin https://github.com/<args>
