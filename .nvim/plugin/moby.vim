" last modified 2015-05-29

func! Get_moby_thesaurus()
  let moby_dir = fnamemodify(&tsr, ':h')
  if !isdirectory(moby_dir)
    call mkdir(moby_dir, 'p')
  endif
  let currdir = getcwd()
  exec 'lcd' moby_dir
  !wget http://www.gutenberg.org/files/3202/files/mthesaur.txt
  "prevent space and apostrophe from being item boundary
  !sed -i -e 's/ / /g' -e 's/'\''/’/g' mthesaur.txt
  !echo '-30- vi:noma' >> mthesaur.txt
  let tsr_basename = fnamemodify(&tsr, ':t')
  if tsr_basename != 'mthesaur.txt'
    exec '!mv mthesaur.txt' tsr_basename
  endif
  redraw!
  exec 'lcd' currdir
endfunc

if &tsr != '' && !filereadable(&tsr)
  call Get_moby_thesaurus()
endif
