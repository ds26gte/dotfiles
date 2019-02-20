" last modified 2019-02-23

ino <tab> <c-n>

" when called in read-only mode (-R)
if &uc == 10000 | nmap q :q<cr> | endif

au termopen * startinsert

"au termopen * setl scbk=-1 | startinsert

au termopen * sp +setl\ mod /tmp/viSessionHasOpenTerminalBuffers | close

au bufread * sil! norm g`"

au bufread,bufnewfile .aliases*,.bash*,.env* setl ft=sh

au bufread,bufnewfile **/bin/* if expand('%:t') !~ '\.' | setl ft=sh | endif

au filetype vim setl fo-=ro isk+=:

au filetype make setl list

au filetype javascript setl sua+=.js,.jsx

func! s:vimleave_hook()
  !mv -n {.,}*.????-??-??T??:??~ ~/.local/share/nvim/backup 2> /dev/null
  !rm -f {.,}*.????-??-??T??:??~
endfunc

au vimleave * sil call s:vimleave_hook()

let signify_vcs_list = ['git']

com! Sum !plus %

com! Vimp e ~/.config/nvim/plugin/misc.vim

com! Htmlbeautify %!html-beautify -f -
