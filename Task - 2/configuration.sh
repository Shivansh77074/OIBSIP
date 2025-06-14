#!/bin/bash
# ufw_configuration.sh - Basic UFW Firewall Setup Script

# Update system
sudo apt update

# Install UFW
sudo apt install ufw -y

# Allow SSH
sudo ufw allow ssh

# Deny HTTP
sudo ufw deny http

# Enable UFW
sudo ufw --force enable

# Show status
sudo ufw status
