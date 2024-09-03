#!/bin/bash

if ! command -v python3 &> /dev/null
then
    echo "ERROR : Python 3 could not be found"
    exit 1
fi

if ! command -v pip3 &> /dev/null
then
    echo "pip3 could not be found, installing..."
    sudo apt install python3-pip
fi

echo "Installing Norminette..."

# Install norminette
pip3 install norminette

USER_BASE_BIN=$(python3 -m site --user-base)/bin
if ! echo $PATH | grep -q $USER_BASE_BIN
then
    echo "Adding Norminette to PATH..."
    echo "export PATH=\"$PATH:$USER_BASE_BIN\"" >> ~/.bashrc
    source ~/.bashrc
fi

echo "Installation complete. You can now use Norminette!"

echo "help : norminette -h"
echo "usage : norminette <file.c> OR"
echo "usage : norminette <directory> OR"
echo "usage : norminette <file.c> <file.c> <file.c> ..."

