#! /bin/sh 
xcode-select --install
python3 -m pip install --upgrade pip
python3 -m pip install ansible

PACKAGE_BASE=`python3 -m site | grep USER_BASE | awk '{print $2}' | tr -d "'"`
PACKAGE_BIN=${PACKAGE_BASE}/bin
export PATH=$PACKAGE_BIN:/opt/homebrew/bin:$PATH 

ansible-galaxy install -r requirements.yml

bin/run-playbook.sh
