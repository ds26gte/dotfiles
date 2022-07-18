# last change 2022-07-16
# Dorai Sitaram

if test "$ENV_ALREADY_LOADED"; then
  export ENV_ALREADY_LOADED=$((ENV_ALREADY_LOADED + 1))
  return
else
  export ENV_ALREADY_LOADED=1
fi

if test -d /home/ds26gte; then

  export PATH=$HOME/.cargo/bin:$PATH
  export PATH=$HOME/src/mpca/bin:$PATH
  export PATH=$HOME/.local/bin:$PATH
  export PATH=$HOME/.nvm/versions/node/v16.14.2/bin:$PATH

  export MANPATH=~/man:/usr/local/share/man:/usr/local/man:

  export MANWIDTH=80

  #history

  export HISTSIZE=500000
  export HISTFILESIZE=100000

  export FZF_DEFAULT_COMMAND='find -L'

  export INFOPATH=/usr/local/share/info:

  export NODE_PATH=/usr/local/lib/node_modules

  #export PYRETHOME=~/public_html/pyret-lang
  export PYRETHOME=~/src/pyret-lang

fi

if test -d /gpfs; then

  export LESS=eFRX

  export EDITOR=vi

  unset -f cp ls mv rm
fi

if test -d /sdcard; then

  export PS1="\w\$ "

  export PATH=~/bin:$PATH
fi

export PATH=.:$HOME/local/bin:$HOME/src/attic/bin:$PATH
