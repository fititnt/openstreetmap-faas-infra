#!/bin/sh

# Nota: rocha@rocha-anortosito.vps.fititnt.org esta usando keypar id_rsa-rocha/id_rsa-rocha.pub

# Clean old known_hosts
ssh-keygen -R server-name.example.com
ssh-keygen -R 123.123.123.123

# Scan new ones
ssh-keyscan server-name.example.com >> ~/.ssh/known_hosts

# change "~/.ssh/id_rsa-rocha.pub" for your custom initial key
sshpass -p StrongPassword ssh-copy-id -i ~/.ssh/id_rsa-rocha.pub root@server-name.example.com
