"last change 2014-10-13

au bufwritepre .exrc mark x | %sort iu | norm 'x

au bufwritepre .aliases* doau bufwritepre .exrc
au bufwritepre .gitignore doau bufwritepre .exrc
au bufwritepre .vimrc doau bufwritepre .exrc
au bufwritepre misc.vim doau bufwritepre .exrc
au bufwritepre **/tmp/green doau bufwritepre .exrc
