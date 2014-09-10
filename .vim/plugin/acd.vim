"last change 2014-09-08

if exists('+acd')
  set acd
else
  au bufenter * lcd %:p:h
endif
