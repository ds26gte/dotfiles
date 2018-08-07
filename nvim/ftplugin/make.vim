" last modified 2018-08-04

syn match errormsg "^[ ]\+"

"trailing space in makefiles is always an unmitigated disaster

au bufwritepre <buffer> sil! %s/\s\+$//
