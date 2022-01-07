#!/usr/bin/env bash

set -e

INSTALL_YARN=${1:-"true"}

# Ensure apt is in non-interactive to avoid prompts
export DEBIAN_FRONTEND=noninteractive

if [ "$(id -u)" -ne 0 ]; then
    echo -e 'Script must be run as root. Use sudo, su, or add "USER root" to your Dockerfile before running this script.'
    exit 1
fi

curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash 
sudo apt-get install -y nodejs

if [ "${INSTALL_YARN}" = "true" ]; then

npm install --global yarn

fi