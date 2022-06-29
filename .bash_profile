# last modified 2022-01-31
# Dorai Sitaram

. $HOME/.bashrc

if which /usr/bin/setxkbmap > /dev/null; then
  /usr/bin/setxkbmap -option "ctrl:nocaps"
  /usr/bin/setxkbmap -option "compose:ralt"
fi

if which /usr/bin/numlockx > /dev/null; then
  /usr/bin/numlockx off
fi
