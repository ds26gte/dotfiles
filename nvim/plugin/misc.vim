" last modified 2019-10-23
" Dorai Sitaram

au bufread,bufnewfile .aliases*,.bash*,.env* setl ft=sh

au bufread,bufnewfile **/bin/* if expand('%:t') !~ '\.' | setl ft=sh | endif

au bufread,bufnewfile view.unicode.tmp.1 syn match title /\<.\>/

au bufread,bufnewfile *.ref setl cpt+=k inf

au filetype conf setl ft=sh

au filetype javascript setl sua+=.js,.jsx

au filetype make setl list

au filetype pdf exec '%!pdftotext -nopgbrk % -' | setl ro

au filetype vim setl fo-=ro isk+=:

com! -nargs=1 NewDigraph sil exec '!trimdigraphfile' <q-args> | ru plugin/moredig.vim

com! Sum !plus %

com! Vimp exec 'e' s:this_file

com! Vinit e ~/.config/nvim/init.vim

if &ro && &uc == 10000 | nmap q :q<cr> | endif

let s:this_file = expand('<sfile>')

nno <leader>o :Ofortuna<cr>
