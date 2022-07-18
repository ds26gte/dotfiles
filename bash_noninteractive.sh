# last modified 2022-07-11
# Dorai Sitaram

if test -z "$VIM" -a -z "$MYVIMRC"
then return
fi

# do only for bash invoked from within vim

shopt -s expand_aliases

# :grep should recognize **

shopt -s globstar

. ~/src/attic/aliases.sh
