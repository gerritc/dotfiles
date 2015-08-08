# add bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# OS X bash dir colors
export CLICOLOR=YES
