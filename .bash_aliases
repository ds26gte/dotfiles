# last change 2014-12-14

set -o vi

shopt -s cdspell
shopt -s extglob
shopt -s globstar
shopt -s nocaseglob
shopt -s autocd

# in ~/.inputrc put
# set completion-ignore-case on

export PATH=.:/usr/local/heroku/bin:$PATH

. ~/.env

. ~/.aliases

. ~/.aliases.more
