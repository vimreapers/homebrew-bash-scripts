#!/bin/bash

# Authored by: Cody Lee Cochran (http://github.com/maxbrisance)

ius-release_version_parser() {
	if [[ "$(uname -o)" != "GNU/Linux" ]]; then
		echo "System is not GNU/Linux. System is unsupported." && exit 1
	elif [ ! -e /etc/redhat-release ]; then
		echo "System is not RHEL-based." && exit 1
	elif [[ "$(uname -p)" != "x86_64" ]]; then
		echo "System has unsupported (non-x86_64) architecture. System is unsupported." && exit 1
	else
		local OS=$(cat /etc/redhat-release | awk '{print $1}')
		local RELEASE=$(cat /etc/redhat-release | awk '{print $4}' | cut -d . -f 1)
		export IUS_REPO_URL=dl.iuscommunity.org/pub/ius/stable/$OS/$RELEASE/x86_64/
		echo "System is supported. Proceeding with install of epel-release.rpm and ius-release.rpm..."
	fi
}

ius-release_installer() {
	if [ -d ./dl.iuscommunity.org/ ]; then
		echo "dl.ius.community.org/ directory already exist. Please rename before proceeding." && exit 1
	else
		echo "Installing appropriate version of ius-release.rpm..."
		wget -r -l 1 -np -A 'ius*.rpm' "http://$IUS_REPO_URL" 1>&/dev/null
		yum install epel-release.rpm -y
		yum localinstall ./$IUS_REPO_URL/*.rpm -y
		echo "Cleaning up setup files..."
		rm -fr ./dl.iuscommunity.org/*
		rmdir ./dl.iuscommunity.org
		echo "Operation complete."
	fi	
}

ius-release_version_parser
ius-release_installer
unset -f ius-release_version_parser
unset -f ius-release_installer
unset IUS_REPO_URL