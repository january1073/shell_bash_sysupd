#!/bin/bash

echo -e "$[ SYSTEM UPDATE v1.8 2025 ]"
cowsay -f eyes "Hi, ${USER}! Let's get this system up to scratch..."

# Apt updates
sudo apt update
sudo apt upgrade -y
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo apt autoclean

# Distro upgrade (only if available)
if sudo do-release-upgrade -c | grep -q "New release"; then
    sudo do-release-upgrade -f DistUpgradeViewNonInteractive
fi

# Snap updates
sudo snap refresh

echo
echo -e "[ SYSTEM UPDATE COMPLETE ]"
echo
echo -e "Your current local file system space usage:"
df -h ~
