" last modified 2019-08-30

" when called in read-only mode (-R)
if &uc == 10000 | nmap q :q<cr> | endif

if &tgc | set pb=41 | endif

ino <s-tab> <c-p>

if $SSH_CONNECTION && !$DISPLAY
  "in chromebook
  no! <c-h> <c-w>
  tno <c-h> <c-w>
endif

let signify_vcs_list = ['git']

"au termopen * setl scbk=-1

au bufread,bufnewfile .aliases*,.bash*,.env* setl ft=sh

au bufread,bufnewfile **/bin/* if expand('%:t') !~ '\.' | setl ft=sh | endif

au filetype vim setl fo-=ro isk+=:

au filetype make setl list

au filetype javascript setl sua+=.js,.jsx

au filetype conf setl ft=sh

com! Htmlbeautify %!html-beautify -f -

com! Sum !plus %

com! Trimfile !trimfile %

com! Vimp e ~/.config/nvim/plugin/misc.vim
