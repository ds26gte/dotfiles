" last modified 2020-01-11
" Dorai Sitaram

set bri
set cb=unnamedplus
set cf
set cot+=longest
set def+=\\\|^\\s*\\((def\\k*\\\|const\\\|fun\\(ction\\\|c\\)\\?!\\?\\\|let\\\|local\\(\\s\\+function\\)\\?\\\|var\\)
set dict=/usr/share/dict/words
set dy-=msgsep
set icm=split
set lbr
set lw-=if
set mouse=n
set sbr=↪\ "
set sd+=%
set spl=en_us
set tgc

let &pm = strftime('.%Y-%m-%d-%Hh%M~')

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

au bufread * sil! norm g`"

func! s:plainTextOptions()
  ino <buffer> "` “
  ino <buffer> `" ”
  ino <buffer> '` ‘
  ino <buffer> `' ’
  nno <buffer> [[ :?^=<cr>
  nno <buffer> ]] :/^=<cr>
endfunc

au bufread,bufnewfile *.a[^r]*,*.[1mt]* call s:plainTextOptions()

au bufread,bufnewfile *
      \ syn match title 'FIXME\|TODO\|XXX' containedin=comment,string |
      \ syn match title '\<\(CAUTION\|IMPORTANT\|NOTE\|TIP\|WARNING\)\>' |
      \ syn match title '^=\+\s.*'

au filetype conf setl ft=sh

au filetype gitmessengerpopup ru syntax/gitmessengerpopup.vim

au filetype javascript setl sua+=.js,.jsx

au filetype make setl list

au filetype lua,vim setl fo-=r fo-=o

au filetype vim setl isk+=:

com! Ftrim sil !ftrim %

com! Sum !plus %

if &ro && &uc == 10000 | nno q :q<cr> | endif
