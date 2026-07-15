#!/bin/bash

# Update OS packages
sudo apt-get update

# Install essential tools (if needed)
sudo apt-get install -y ufw

# Enable firewall
sudo ufw enable

echo "System updated and firewall enabled."