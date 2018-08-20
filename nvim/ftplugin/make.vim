" last modified 2018-08-21

syn match errormsg "^[ ]\+"

"trailing space in makefiles can be dangerous in variable settings

au bufwritepre <buffer> sil! %s/\s\+$//
