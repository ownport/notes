#!/bin/sh

echo 'Creating user: ownport ...'
adduser --disabled-password --gecos '' --uid 1000 ownport 
adduser ownport sudo
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
chown -R ownport:ownport /data/blog
# sudo -u ownport /bin/bash
exec su - ownport

