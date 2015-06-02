" last modified 2015-05-30

let s:words_per_minute = 124

com! Talk sil exec '!echo $(cat %|wc -w)/' s:words_per_minute '| bc'
