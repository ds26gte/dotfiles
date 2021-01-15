# last change 2021-01-15

set -o vi

shopt -s cdspell
shopt -s extglob
shopt -s globstar
shopt -s nocaseglob
shopt -s autocd

. ~/src/dotfiles/.env.sh

. ~/src/aliases/aliases.sh

if test \
  ! -d /gpfs -a \
  ! -d /sdcard -a  \
  ! "$VIM" -a \
  ! "$TMUX" ; then
  tmux new -s t$$
fi
