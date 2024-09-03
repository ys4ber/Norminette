#!/bin/bash

set -e

if ! command -v python3 &> /dev/null
then
    echo "ERROR : Python 3 could not be found"
    exit 1
fi

if ! command -v pip3 &> /dev/null
then
    echo "pip3 could not be found, installing..."
    sudo apt install -y python3-pip
fi

if ! command -v virtualenv &> /dev/null
then
    echo "virtualenv could not be found, installing..."
    sudo apt install -y python3-virtualenv
fi

echo "Creating a virtual environment for Norminette..."
python3 -m venv norminette_env

echo "Activating the virtual environment..."
source norminette_env/bin/activate

echo "Installing Norminette..."
pip install norminette

echo "Verifying Norminette installation..."
if norminette --version &> /dev/null
then
    echo "Norminette installed successfully."
else
    echo "ERROR : Norminette installation failed."
    deactivate
    exit 1
fi

echo "Deactivating the virtual environment..."
deactivate

echo "Installation complete. You can now use Norminette by activating the virtual environment with 'source norminette_env/bin/activate' and then running 'norminette'."

echo "help : norminette -h"
echo "usage : norminette <file.c> OR"
echo "usage : norminette <directory> OR"
echo "usage : norminette <file.c> <file.c> <file.c> ..."