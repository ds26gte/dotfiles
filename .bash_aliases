# last change 2021-05-18

set -o vi

shopt -s cdspell
shopt -s extglob
shopt -s globstar
shopt -s nocaseglob
shopt -s autocd

test -f ~/src/aliases/env.sh && . ~/src/aliases/env.sh

test -f ~/src/aliases/aliases.sh && . ~/src/aliases/aliases.sh

if test \
  ! -d /gpfs -a \
  ! -d /sdcard -a  \
  ! "$VIM" -a \
  ! "$TMUX" ; then
  tmux new -s t$$
fi
