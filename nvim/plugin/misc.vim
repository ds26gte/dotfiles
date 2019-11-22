" last modified 2019-11-26
" Dorai Sitaram

au cmdlineenter * sil! let g:isk_sv = &l:isk | setl isk& noscs
au cmdlineleave * sil! let &l:isk = g:isk_sv | setl scs

au filetype conf setl ft=sh

au filetype diff,gitcommit setl syn=diff

au filetype help setl tw=78

au filetype javascript setl sua+=.js,.jsx

au filetype make setl list

au filetype lua,vim setl fo-=r fo-=o

au filetype vim setl isk+=:

au filetype * syn match colorcolumn 'FIXME\|TODO\|XXX' containedin=comment

au syntax diff syn match diffadd '^+.*' | syn match difftext '^-.*'

let netrw_preview = 1
let netrw_winsize = float2nr(&co * 0.8)

let matchup_matchparen_offscreen = {}

let signify_vcs_list = ['git']
nno cD :SignifyDiff<cr>
nno cd :SignifyHunkDiff<cr>

sil! exec 'so' system('dpkg-query -L fzf | grep fzf.vim | head -1')

com! Sum !plus %

com! Vimp exec 'e' s:thisFile

com! Vinit e $MYVIMRC

if &ro && &uc == 10000 | nmap q :q<cr> | endif

let s:thisFile = expand('<sfile>')
