# last modified 2021-01-15
# Dorai Sitaram

if test -z "$VIM"
then return
fi

# do only for bash invoked from within vim

shopt -s expand_aliases

# :grep should recognize **

shopt -s globstar

. ~/src/aliases/aliases.sh
