" last change 2015-01-30

au bufwritepre .vimrc mark x | %sort iu | norm 'x

au bufwritepre **/tmp/green doau bufwritepre .vimrc
au bufwritepre .aliases* doau bufwritepre .vimrc
au bufwritepre .XCompose doau bufwritepre .vimrc
au bufwritepre .exrc doau bufwritepre .vimrc
au bufwritepre .gitignore doau bufwritepre .vimrc
au bufwritepre misc.vim doau bufwritepre .vimrc
au bufwritepre paideia.txt doau bufwritepre .vimrc
