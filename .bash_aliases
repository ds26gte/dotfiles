# last change 2022-07-05

set -o vi

shopt -s cdspell
shopt -s extglob
shopt -s globstar
shopt -s nocaseglob
shopt -s autocd

bind 'set completion-ignore-case on'

test -f ~/src/attic/env.sh && . ~/src/attic/env.sh

test -f ~/src/attic/aliases.sh && . ~/src/attic/aliases.sh

if test \
  ! -d /gpfs -a \
  ! -d /sdcard -a  \
  ! "$VIM" -a \
  ! "$TMUX" ; then
  tmux new -s t$$
fi
