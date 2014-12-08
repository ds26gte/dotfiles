" last modified 2014-12-07

com! Aspell !cat % | aspell -a | grep "^&" | sed -e "s:^&\s*\(\S\+\).*:\1:" | sort -u | less
