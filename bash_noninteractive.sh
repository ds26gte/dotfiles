# last modified 2022-07-10
# Dorai Sitaram

if test -z "$MYVIMRC"
then return
fi

# do only for bash invoked from within vim

shopt -s expand_aliases

# :grep should recognize **

shopt -s globstar

. ~/src/attic/aliases.sh
