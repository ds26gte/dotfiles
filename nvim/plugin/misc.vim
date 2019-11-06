" last modified 2019-11-05
" Dorai Sitaram

au cmdlineenter * sil! let g:isk_sv = &l:isk | setl isk& noscs
au cmdlineleave * sil! let &l:isk = g:isk_sv | setl scs

au filetype conf setl ft=sh

au filetype gitcommit setl syn=diff

au filetype javascript setl sua+=.js,.jsx

au filetype make setl list

au filetype vim setl isk+=:

au filetype lua,vim setl fo-=r fo-=o

au syntax diff syn match diffadd '^+.*' | syn match difftext '^-.*'

let matchup_matchparen_offscreen = {}

let signify_vcs_list = ['git']
nno <leader>d :SignifyDiff<cr>
nno <leader>f :SignifyHunkDiff<cr>

com! Sum !plus %

com! Vimp exec 'e' s:thisFile

com! Vinit e $MYVIMRC

if &ro && &uc == 10000 | nmap q :q<cr> | endif

let s:thisFile = expand('<sfile>')
