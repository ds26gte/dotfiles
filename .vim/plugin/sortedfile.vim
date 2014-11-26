" last change 2014-11-26

au bufwritepre .vimrc mark x | %sort iu | norm 'x

au bufwritepre **/tmp/green doau bufwritepre .vimrc
au bufwritepre .aliases* doau bufwritepre .vimrc
au bufwritepre .exrc doau bufwritepre .vimrc
au bufwritepre .gitignore doau bufwritepre .vimrc
au bufwritepre misc.vim doau bufwritepre .vimrc
au bufwritepre xdig.vim doau bufwritepre .vimrc
