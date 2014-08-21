"last change 2008-10-21

au bufreadpre *.doc setl readonly
au bufreadpost *.doc sil %!antiword %
au bufwritepre *.doc sil bdelete!
