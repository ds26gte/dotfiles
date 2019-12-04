" last modified 2019-12-15
" Dorai Sitaram

" this won't set 'inde' in init.vim
au filetype conf setl ft=sh

au filetype javascript setl sua+=.js,.jsx

au filetype make setl list

au filetype lua,vim setl fo-=r fo-=o

au filetype vim setl isk+=:

let netrw_preview = 1
let netrw_winsize = float2nr(&co * 0.8)

let matchup_matchparen_offscreen = {}

let signify_vcs_list = ['git']

nno cD :SignifyDiff<cr>
nno cd :SignifyHunkDiff<cr>

sil! exec 'so' system('dpkg-query -L fzf | grep fzf.vim | sed 1q')

tno <esc><esc> <c-\><c-n>

com! Sum !plus %

com! Vimp exec 'e' s:thisFile

com! Vinit e $MYVIMRC

if &ro && &uc == 10000 | nmap q :q<cr> | endif

let s:thisFile = expand('<sfile>')
