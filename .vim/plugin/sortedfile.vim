"last change 2014-09-29

au bufwritepre .exrc mark x | %sort iu | norm 'x

au bufwritepre .aliases* doau bufwritepre .exrc
au bufwritepre .vimrc doau bufwritepre .exrc
au bufwritepre misc.vim doau bufwritepre .exrc
