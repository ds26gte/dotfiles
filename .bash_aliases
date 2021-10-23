# last change 2021-10-23

set -o vi

shopt -s cdspell
shopt -s extglob
shopt -s globstar
shopt -s nocaseglob
shopt -s autocd

test -f ~/src/attic/env.sh && . ~/src/attic/env.sh

test -f ~/src/attic/aliases.sh && . ~/src/attic/aliases.sh

if test \
  ! -d /gpfs -a \
  ! -d /sdcard -a  \
  ! "$VIM" -a \
  ! "$TMUX" ; then
  tmux new -s t$$
fi
