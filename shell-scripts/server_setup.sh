#!/bin/bash

###############################################################################
# Script Name: server_setup.sh
# Description:
#   Connects to a remote Ubuntu server using SSH, updates the system,
#   installs the Nginx web server, enables the service, and verifies
#   the installation.
#
# Usage:
#   ./server_setup.sh <username> <server_ip_or_hostname>
#
# Example:
#   ./server_setup.sh ubuntu 192.168.1.100
###############################################################################

# Exit if any command fails
set -e

#############################
# Function: Display Help
#############################
usage() {
    echo "Usage: $0 <username> <server_ip_or_hostname>"
    echo "Example:"
    echo "   $0 ubuntu 192.168.1.100"
    exit 1
}

#############################
# Check Parameters
#############################
if [ "$#" -ne 2 ]; then
    echo "Error: Missing required parameters."
    usage
fi

USERNAME=$1
SERVER=$2

#############################
# Check SSH Installation
#############################
if ! command -v ssh >/dev/null 2>&1; then
    echo "Error: SSH is not installed."
    echo "Install it using:"
    echo "sudo apt update && sudo apt install openssh-client"
    exit 1
fi

#############################
# Test SSH Connection
#############################
echo "Testing SSH connection..."

if ! ssh -o BatchMode=yes -o ConnectTimeout=10 ${USERNAME}@${SERVER} "exit" 2>/dev/null
then
    echo "Unable to connect to ${SERVER}"
    echo
    echo "Possible causes:"
    echo "- Incorrect username"
    echo "- Wrong server IP"
    echo "- SSH service not running"
    echo "- SSH key not configured"
    echo "- Firewall blocking port 22"
    exit 1
fi

echo "SSH connection successful."
echo

#############################
# Execute Remote Commands
#############################

ssh ${USERNAME}@${SERVER} <<'EOF'

echo "====================================="
echo "Updating package lists..."
echo "====================================="

sudo apt update

echo "====================================="
echo "Upgrading installed packages..."
echo "====================================="

sudo apt upgrade -y

echo "====================================="
echo "Installing Nginx..."
echo "====================================="

sudo apt install nginx -y

echo "====================================="
echo "Starting Nginx..."
echo "====================================="

sudo systemctl enable nginx
sudo systemctl start nginx

echo "====================================="
echo "Checking Nginx status..."
echo "====================================="

sudo systemctl status nginx --no-pager

echo
echo "Installed Nginx Version:"
nginx -v

echo
echo "Web server installation completed successfully."

EOF

echo
echo "====================================="
echo "Remote server configuration completed."
echo "====================================="