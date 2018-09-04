" last modified 2018-09-07

au bufread * sil! norm g`"

" when called in read-only mode (-R)
if &uc == 10000 | nmap q :q<cr> | endif

ino <tab> <c-n>

tno <c-h> <c-w>

sil! tno <c-v><esc> <esc>
sil! tno <esc> <c-\><c-n>

"set dip+=iwhite

sil! au termopen * startinsert

"sil! au termopen * setl scbk=-1 | startinsert

let is_mzscheme = 1

au bufwritepost **/nvim/plugin/c12h22o11.vim sil !makectermalerts

au colorscheme default ru! plugin/c12h22o11.vim

au bufread,bufnewfile .aliases*,.bash*,.env*,**/bin/* setl ft=sh

au bufread,bufnewfile **/bin/*.css setl ft=css

au bufread,bufnewfile view.*tmp.* setf help

sil! au termopen * sp /tmp/viSessionHasOpenTerminalBuffers | %d | setl mod | close

au filetype vim setl fo-=r isk+=:

au filetype make setl list

au filetype asciidoc setl com=b://,sb:////,eb://// inf tw=65

let g:signify_vcs_list = ['git']

let g:loaded_man = 1

syn off

au bufwritepost **/tmspeech/*.adoc sil !kadoc % >/dev/null

GHplugin mhinz/vim-signify

GHplugin tpope/vim-fugitive

GHplugin misterbuckley/vim-definitive

GHplugin walm/jshint.vim

Plugin ~/src/neoscmindent

com! Sum !plus %

com! Tmspeech e ~/src/tmspeech/pole.adoc
com! Vimc e ~/.config/nvim/plugin/c12h22o11.vim
com! Vimp e ~/.config/nvim/plugin/misc.vim
