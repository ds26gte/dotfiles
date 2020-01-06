" last modified 2020-01-11
" created 2019-11-27
" Dorai Sitaram

if !exists('$GIT_EXEC_PATH')
  " load rest only if called by a vim subprocess from
  " git-jump or git-commit
  finish
endif

if exists('$GIT_AUTHOR_NAME')
  " called from git-commit
  ru syntax/diff.vim
else
  " called from git-jump
  au filetype * call s:gitJumpOptions()
endif

func! s:gitJumpOptions()
  " highlight merge hunks
  syn region difftext start=/^<<<<<<</ end=/\n\(^|||||||\|^=======$\)\@=/
  syn region diffchange start=/^|||||||/ end=/^=======$/
  syn region diffadd start=/\(^=======\n\)\@<=/ end=/^>>>>>>>.*/

  " use [c ]c to navigate merge/diff hunks
  nno <buffer> [c :cp<cr>
  nno <buffer> ]c :cn<cr>
endfunc
