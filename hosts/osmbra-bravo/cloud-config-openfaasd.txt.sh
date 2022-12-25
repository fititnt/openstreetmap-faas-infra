#!/bin/sh

# Based on https://github.com/openfaas/faasd/blob/master/cloud-config.txt

#    #cloud-config
#    ssh_authorized_keys:
#    ## Note: Replace with your own public key
#      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8Q/aUYUr3P1XKVucnO9mlWxOjJm+K01lHJR90MkHC9zbfTqlp8P7C3J26zKAuzHXOeF+VFxETRr6YedQKW9zp5oP7sN+F2gr/pO7GV3VmOqHMV7uKfyUQfq7H1aVzLfCcI7FwN2Zekv3yB7kj35pbsMa1Za58aF6oHRctZU6UWgXXbRxP+B04DoVU7jTstQ4GMoOCaqYhgPHyjEAS3DW0kkPW6HzsvJHkxvVcVlZ/wNJa1Ie/yGpzOzWIN0Ol0t2QT/RSWOhfzO1A2P0XbPuZ04NmriBonO9zR7T1fMNmmtTuK7WazKjQT3inmYRAqU6pe8wfX8WIWNV7OowUjUsv alex@alexr.local
#
#    package_update: true
#
#    packages:
#    - runc
#    - git
#
#    runcmd:
#    - curl -sfL https://raw.githubusercontent.com/openfaas/faasd/master/hack/install.sh | bash -s -
#    - systemctl status -l containerd --no-pager
#    - journalctl -u faasd-provider --no-pager
#    - systemctl status -l faasd-provider --no-pager
#    - systemctl status -l faasd --no-pager
#    - curl -sSLf https://cli.openfaas.com | sh
#    - sleep 60 && journalctl -u faasd --no-pager
#    - cat /var/lib/faasd/secrets/basic-auth-password | /usr/local/bin/faas-cli login --password-stdin


apt-get update
apt-get upgrade -y
apt-get install runc -y
apt-get install git -y

curl -sfL https://raw.githubusercontent.com/openfaas/faasd/master/hack/install.sh | bash -s -
systemctl status -l containerd --no-pager
journalctl -u faasd-provider --no-pager
systemctl status -l faasd-provider --no-pager
systemctl status -l faasd --no-pager

curl -sSLf https://cli.openfaas.com | sh

sleep 60 && journalctl -u faasd --no-pager

cat /var/lib/faasd/secrets/basic-auth-password | /usr/local/bin/faas-cli login --password-stdin

# package_update: true

# packages:
#  - runc
#  - git

# runcmd:
# - curl -sfL https://raw.githubusercontent.com/openfaas/faasd/master/hack/install.sh | bash -s -
# - systemctl status -l containerd --no-pager
# - journalctl -u faasd-provider --no-pager
# - systemctl status -l faasd-provider --no-pager
# - systemctl status -l faasd --no-pager
# - curl -sSLf https://cli.openfaas.com | sh
# - sleep 60 && journalctl -u faasd --no-pager
# - cat /var/lib/faasd/secrets/basic-auth-password | /usr/local/bin/faas-cli login --password-stdin