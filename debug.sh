#!/bin/bash
set -e

# Visualize your Parser!

# Check package installed

if [  $(which graphviz) ]
then
	sudo apt install graphviz
fi

# Create .png
dot -Tpng parser.dot > parser.png

echo "Success"

