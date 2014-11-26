" last change 2014-11-26

au bufwritepre .vimrc mark x | %sort iu | norm 'x

au bufwritepre **/tmp/green doau bufwritepre .exrc
au bufwritepre .aliases* doau bufwritepre .exrc
au bufwritepre .exrc doau bufwritepre .exrc
au bufwritepre .gitignore doau bufwritepre .exrc
au bufwritepre misc.vim doau bufwritepre .exrc
