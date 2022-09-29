#!/bin/bash
set -e

# Visualize your Parser!
#######################

# Check user
if [ $EUID -ne 0 ]
then
	echo -e "Please run this script in the docker"
	exit 1
fi
# Check package installed

if [ ! $(which dot) ]
then
	echo "dot not found"
	export DEBIAN_FRONTEND=noninteractive
	apt-get update
	apt-get -y install graphviz
fi

# Create .png
if [ -e "parser.gv" ]
then
	dot -Tpng parser.gv > parser.png
else
	dot -Tpng parser.dot > parser.png
fi

echo "Success"

