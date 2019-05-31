" last modified 2019-05-29

" when called in read-only mode (-R)
if &uc == 10000 | nmap q :q<cr> | endif

"au termopen * setl scbk=-1

au bufread,bufnewfile .aliases*,.bash*,.env* setl ft=sh

au bufread,bufnewfile **/bin/* if expand('%:t') !~ '\.' | setl ft=sh | endif

au filetype vim setl fo-=ro isk+=:

au filetype make setl list

au filetype javascript setl sua+=.js,.jsx

au filetype conf setl ft=sh

com! Sum !plus %

com! Vimp e ~/.config/nvim/plugin/misc.vim

com! Htmlbeautify %!html-beautify -f -
