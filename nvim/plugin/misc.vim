" last modified 2019-10-21
" Dorai Sitaram

au bufread,bufnewfile .aliases*,.bash*,.env* setl ft=sh

au bufread,bufnewfile **/bin/* if expand('%:t') !~ '\.' | setl ft=sh | endif

au bufread,bufnewfile view.unicode.tmp.1 syn match title /\<.\>/

au bufread,bufnewfile *.ref setl cpt+=k inf

au filetype make setl list

au filetype javascript setl sua+=.js,.jsx

au filetype conf setl ft=sh

com! -nargs=1 NewDigraph sil exec '!trim-digraph-file' <q-args> | ru plugin/moredig.vim

com! Sum !plus %

com! Vimp exec 'e' s:this_file

if &uc == 10000 | nmap q :q<cr> | endif " when called in read-only mode (-R)

let s:this_file = expand('<sfile>')

nno <leader>o :Ofortuna<cr>
