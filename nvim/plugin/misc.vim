" last modified 2018-10-01

ino <tab> <c-n>

tno <c-h> <c-w>

tno <c-v><esc> <esc>

tno <esc> <c-\><c-n>

" when called in read-only mode (-R)
if &uc == 10000 | nmap q :q<cr> | endif

au termopen * startinsert

"au termopen * setl scbk=-1 | startinsert

au termopen * sp /tmp/viSessionHasOpenTerminalBuffers | setl mod | close

au bufread * sil! norm g`"

au bufread,bufnewfile .aliases*,.bash*,.env* setl ft=sh

au bufread,bufnewfile **/bin/* if expand('%:t') !~ '\.' | setl ft=sh | endif

au bufread,bufnewfile view.*tmp.* setf help

au bufread,bufnewfile *.ad setl ft=asciidoc

au filetype vim setl fo-=r isk+=:

au filetype make setl list

au filetype asciidoc setl cpt+=k inf tw=65 | call UniCycleBuf()

au bufwritepost **/tmspeech/*.ad sil !kadoc % >/dev/null

let g:signify_vcs_list = ['git']

let is_mzscheme = 1

GHplugin mhinz/vim-signify

GHplugin tpope/vim-fugitive

GHplugin misterbuckley/vim-definitive

GHplugin vim-scripts/UniCycle

Plugin ~/src/neoscmindent

func! UniCycleBuf()
  "inoremap <buffer> - -<Esc>:call UniCycleHyphen()<CR>a
  "inoremap <buffer> . .<Esc>:call UniCyclePeriod()<CR>a
  inoremap <buffer> ' x<Esc>:call UniCycleApostrophe()<CR>a
  inoremap <buffer> " x<Esc>:call UniCycleQuote()<CR>a
endfunc

com! Sum !plus %

com! Tmspeech e ~/src/tmspeech/utopia.adoc

com! Vimc e ~/.config/nvim/plugin/c12h22o11.vim

com! Vimp e ~/.config/nvim/plugin/misc.vim

com! Htmlbeautify %!html-beautify -f -
