" last modified 2019-09-30
" Dorai Sitaram

func! Identify_string(qc)
  "this is so matchit & matchup can ignore parens within strings
  exec 'syn region string start=/\(\\\)\@<!' . a:qc . '/ skip=/\\[\\' . "\"'" . ']/ end=/' . a:qc . '/'
endfunc

func! s:luaOptions()
  call Identify_string('"')
  call Identify_string("'")
endfunc

au filetype lua call s:luaOptions()
