#!/usr/bin/env bash
# Configures ufw to deny all incoming traffic except for ssh, http, https

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22
sudo ufw allow 443
sudo ufw allow 80
sudo ufw enable
