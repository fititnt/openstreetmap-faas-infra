#!/bin/sh
#===============================================================================
#
#          FILE:  custom-ssh-port.sh
#
#         USAGE:  ./deploy-functions.sh
#
#   DESCRIPTION:
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha
#       COMPANY:  ---
#       LICENSE:  Public Domain
#       VERSION:  1.0
#       CREATED:  2020-08-17 00:36 BRT
#      REVISION:  ---
#===============================================================================
# shellcheck disable=SC2317
echo "Manual setup"
exit 0

# PROTIP: if want to use ansible itself to manange ports before/after, just create
#         and ALIAS on the local ssh config file on CONTROL node, e.g. ~/.ssh/config
#         see https://stackoverflow.com/questions/34333058/ansible-change-ssh-port-in-playbook

ssh root@example.com

# Veja as portas abertas no momento
sudo netstat -tulnp

# Veja o que o sshd_config tem no momento
sudo grep -i port /etc/ssh/sshd_config

sudo sed -i "s/#Port 22/Port 65432/" /etc/ssh/sshd_config

sudo grep -i port /etc/ssh/sshd_config

# /etc/systemd/system/ssh.socket.d/port.conf precisa conter nova porta
# ou o servidor podera tentar iniciar na porta 22 em vez da correta
sudo mkdir /etc/systemd/system/ssh.socket.d/

echo "[Socket]
ListenStream=
ListenStream=65432
" | sudo tee /etc/systemd/system/ssh.socket.d/port.conf

# Valide com comando abaixo
sudo /usr/sbin/sshd -t

# Reinicie para forcar entrar em ação
sudo systemctl restart ssh.service

# Cheque resultado
sudo systemctl status ssh.service
sudo netstat -tulnp

# ### Locaweb precisa de 'sudo systemctl disable ssh.socket', senao ira ignorar o /etc/ssh/sshd_config!
# sudo systemctl disable ssh.socket
# sudo systemctl restart ssh.service
# sudo systemctl status ssh.service

# Nota: cheque se o firewall (caso esteja ativo) libera a respectiva porta
sudo ufw status verbose
sudo iptables -L

# Para liberar temporariamente caso o UFW esteja sendo usado
sudo ufw limit 65432

sudo reboot