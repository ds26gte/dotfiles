" last modified 2015-05-25

au bufread,bufnewfile sos/*.txt setl mp=txt2page\ -Tdocx

au bufwritepost sos/*.txt make | redraw
