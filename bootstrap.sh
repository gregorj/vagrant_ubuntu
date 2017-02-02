#!/bin/bash

# set up basic tools
sudo apt-get update -y
sudo apt-get install -y nano vim screen libpq-dev libxml2-dev libxslt1-dev libffi-dev gettext git git-review

# install extra packages from packages.sh
source /vagrant/packages.sh

# setup ssh keys
for key in `ls /vagrant/keys/`; do
    cp /vagrant/keys/$key ~/.ssh
    chmod 600 ~/.ssh/$key
done

# Move colors folder to .vim dir for vim colorschemes
mkdir -p ~/.vim/colors
for colorscheme in `ls /vagrant/colorschemes_vim/`; do
    cp /vagrant/colorschemes_vim/$colorscheme ~/.vim/colors
done

# vim setup
cat > ~/.vimrc << EOF
set number                                                                
set cursorline
set showmatch
colorscheme molokai
syntax on
EOF

# colorize terminal for macosx
cat > ~/.bash_profile << EOF
# Command line fixes
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
EOF

# setup git config
source /vagrant/config_git.sh
