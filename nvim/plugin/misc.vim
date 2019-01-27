" last modified 2019-01-27

ino <tab> <c-n>

" when called in read-only mode (-R)
if &uc == 10000 | nmap q :q<cr> | endif

au termopen * startinsert

"au termopen * setl scbk=-1 | startinsert

au termopen * sp +setl\ mod /tmp/viSessionHasOpenTerminalBuffers | close

au bufread * sil! norm g`"

au bufread,bufnewfile .aliases*,.bash*,.env* setl ft=sh

au bufread,bufnewfile **/bin/* if expand('%:t') !~ '\.' | setl ft=sh | endif

au bufread,bufnewfile view.*tmp.* setf help

au filetype vim setl fo-=ro isk+=:

au filetype make setl list

au filetype javascript setl sua+=.js,.jsx

au bufwritepost **/tmspeech/*.adoc sil !kadoc %

au vimleave * sil !mv -n {.,}*.????-??-??T??:??~ ~/.local/share/nvim/backup 2> /dev/null

func! Unicyclebuf()
  "inoremap <buffer> - -<Esc>:call UniCycleHyphen()<CR>a
  "inoremap <buffer> . .<Esc>:call UniCyclePeriod()<CR>a
  inoremap <buffer> ' x<Esc>:call UniCycleApostrophe()<CR>a
  inoremap <buffer> " x<Esc>:call UniCycleQuote()<CR>a
endfunc

au filetype asciidoc setl cpt+=k inf tw=65 | call Unicyclebuf()

let signify_vcs_list = ['git']

colo apprentice

com! Sum !plus %

com! Tmspeech e ~/src/tmspeech/utopia.adoc

com! Vimc e ~/.config/nvim/plugin/c12h22o11.vim

com! Vimp e ~/.config/nvim/plugin/misc.vim

com! Htmlbeautify %!html-beautify -f -
