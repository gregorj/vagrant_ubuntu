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

# vim setup
cat > /home/ubuntu/.vimrc << EOF
set number
EOF

# setup git config
source /vagrant/config_git.sh
