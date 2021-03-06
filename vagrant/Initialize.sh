#!/bin/bash
# upgrade all packages
export DEBIAN_FRONTEND=noninteractive

sudo apt-get -y install git    \
	           make         \
	           python-yaml   \
		   python-jinja2  \
		   python-paramiko \
	           software-properties-common

cd /tmp
git clone https://github.com/ansible/ansible.git
cd ansible
git checkout release1.4.4
make install

cd /tmp
rm -rf ansible

cd /vagrant_host
ansible-playbook -c local -i hosts -v site.yml
