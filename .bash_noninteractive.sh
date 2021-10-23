# last modified 2021-10-23
# Dorai Sitaram

if test -z "$VIM"
then return
fi

# do only for bash invoked from within vim

shopt -s expand_aliases

# :grep should recognize **

shopt -s globstar

. ~/src/attic/aliases.sh
