"last change 2014-09-10

au bufwritepre .exrc mark x | %sort iu | norm 'x

au bufwritepre .aliases doau bufwritepre .exrc
au bufwritepre .aliases.more doau bufwritepre .exrc
au bufwritepre misc.vim doau bufwritepre .exrc
