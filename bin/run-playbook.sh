#! /bin/sh

PACKAGE_BASE=`python3 -m site | grep USER_BASE | awk '{print $2}' | tr -d "'"`
PACKAGE_BIN=${PACKAGE_BASE}/bin

export PATH=$PACKAGE_BIN:/opt/homebrew/bin:$PATH

ansible-playbook -i "localhost," -c local osx_setup.yml --ask-become-pass --ask-vault-pass

chezmoi diff
