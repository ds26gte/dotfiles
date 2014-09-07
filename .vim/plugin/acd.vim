"last change 2014-08-29

if exists("+acd")
  set acd
else
  au bufenter * lcd %:p:h
endif
