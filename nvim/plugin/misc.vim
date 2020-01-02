" last modified 2020-01-02
" Dorai Sitaram

au filetype conf setl ft=sh

au filetype javascript setl sua+=.js,.jsx

au filetype make setl list

au filetype lua,vim setl fo-=r fo-=o

au filetype vim setl isk+=:

au bufread,bufnewfile *
      \ syn match title 'FIXME\|TODO\|XXX' containedin=comment,string |
      \ syn match title '\<\(CAUTION\|IMPORTANT\|NOTE\|TIP\|WARNING\)\>' |
      \ syn match title '^=\+\s.*'

let matchup_matchparen_offscreen = {}

let signify_vcs_list = ['git']

nno cD :SignifyDiff<cr>
nno cd :SignifyHunkDiff<cr>

let netrw_preview = 1
let netrw_winsize = float2nr(&co * 0.8)

sil! exec 'so' system('dpkg-query -L fzf | grep fzf.vim | sed 1q')

nno c8 :Files<cr>
nno c9 :GFiles<cr>

tno <esc><esc> <c-\><c-n>

func! s:smartquotes()
  ino <buffer> "` “
  ino <buffer> `" ”
  ino <buffer> '` ‘
  ino <buffer> `' ’
endfunc

au bufread,bufnewfile *.a[^r]*,*.[1mt]* call s:smartquotes()

com! Sum !plus %

if &ro && &uc == 10000 | nno q :q<cr> | endif
