" last modified 2019-12-03
" Dorai Sitaram

if !exists('$GIT_EXEC_PATH')
  " load only if called by a subprocess vi of
  " `git jump` or `git commit`
  finish
endif

if exists('$GIT_AUTHOR_NAME')
  " called from `git commit`
  au filetype * call s:gitCommitOptions()
else
  " called from `git jump`
  au filetype * call s:gitJumpOptions()
endif

func! s:gitCommitOptions()
  " gray out comments
  syn match nontext '^#.*'

  " highlight diffs if shown
  syn match diffadd '^+.*'
  syn match difftext '^-.*'
endfunc

func! s:gitJumpOptions()
  " highlight merge hunks
  syn region difftext start=/^<<<<<<</ end=/\n\(^|||||||\|^=======$\)\@=/
  syn region diffchange start=/^|||||||/ end=/^=======$/
  syn region diffadd start=/\(^=======\n\)\@<=/ end=/^>>>>>>>.*/

  " use [c ]c to navigate merge/diff hunks
  nno <buffer> [c :cp<cr>
  nno <buffer> ]c :cn<cr>
endfunc
