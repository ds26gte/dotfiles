" last modified 2018-08-06

au bufread * sil! norm g`"

" when called in read-only mode (-R)
if &uc == 10000 | nmap q :q<cr> | endif

ino <tab> <c-n>

tno <c-h> <c-w>

sil! tno <c-v><esc> <esc>
sil! tno <esc> <c-\><c-n>

"set dip+=iwhite

sil! au termopen * setl scbk=-1 | startinsert

sil! Plugin https://github.com/mhinz/vim-signify
sil! Plugin https://github.com/tpope/vim-fugitive

sil! Plugin https://github.com/ds26gte/neoscmindent

let is_mzscheme = 1

au bufwritepost **/nvim/plugin/c12h22o11.vim sil !makectermalerts

au colorscheme default ru! plugin/c12h22o11.vim

au bufread,bufnewfile .aliases*,.bash*,.env*,**/bin/* setl ft=sh

sil! au termopen * sp /tmp/viSessionHasOpenTerminalBuffers | %d | setl mod | close

au filetype vim setl fo-=r isk+=:

au filetype vim let &l:pa = &g:pa . &rtp

let g:signify_vcs_list = ['git']

syn off

au bufwritepost **/tmspeech/*.adoc sil! make

com! Sum !plus %

com! Tmspeech e ~/src/tmspeech/pole.adoc
com! Vimc e ~/.config/nvim/plugin/color.vim
com! Vimp e ~/.config/nvim/plugin/misc.vim
