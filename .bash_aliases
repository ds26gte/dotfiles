# last change 2020-09-22

set -o vi

shopt -s cdspell
shopt -s extglob
shopt -s globstar
shopt -s nocaseglob
shopt -s autocd

. ~/src/dotfiles/.env

. ~/src/aliases/aliases

if test ! "$TMUX" -a ! "$VIM" -a \
  ! -d /gpfs -a \
  ! -d /sdcard
then
  tmux new -s t$$
fi
