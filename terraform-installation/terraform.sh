#!/usr/bin/bash

# Update repo and install additional packages 
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common 

# Install GPG key
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

# Add repository to the system
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

# Update package manager
sudo apt update

# Install Terraform
sudo apt-get install terraform -y
