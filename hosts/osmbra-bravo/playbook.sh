#!/bin/sh
############################ Playbook: osmbra-bravo ############################
# VPS (KVM), 4 vCPUs, 8GB RAM, 200GB SSD, Ubuntu Server 20.04, Contabo (Germany)
#
# Datacenter: Contabo, Germany
# Type: Virtual Machine, KVM
# OS: Ubuntu Server 20.04 LTS 64bit
# CPU: 4 vCPUs
# RAM: 8GB RAM
# Disk: 200GB SSD
#
# IPv4: 167.86.127.220
# IPv6:
# Domain:
#   Full: osmbra-bravo.etica.ai
#   Short:
#
# Domain, extras:
#  - osmbra-bravo.etica.ai (TTL: 15 min)
#
# Login:
#   ssh user@osmbra-bravo.etica.ai
#   ssh root@osmbra-bravo.etica.ai
#
# -----------------------------------------------------------------------------#
# LICENSE: Public Domain
#   Except where otherwise noted, content on this server configuration and to
#   the extent possible under law, Emerson Rocha has waived all copyright and
#   related or neighboring rights to this work to Public Domain
#
# MAINTAINER: Emerson Rocha <rocha(at)ieee.org>
#   Keep in mind that several people help with suggestions, testing, bugfixes
#   and inspiration without get names noted in places that most software
#   developers look. I'm saying this in special for people who help over
#   Facebook discussions. Even the ones without a personal computer yet and/or
#   with limited access to internet.
#
# SECURITY:
#   Reporting a Vulnerability:
#   Send e-mail to Emerson Rocha: rocha(at)ieee.org.
################################################################################
echo "cat playbook.sh"
echo "exiting..."
exit 1

# - https://github.com/openfaas/faasd
# - https://blog.alexellis.io/deploy-serverless-faasd-with-cloud-init/
# - https://www.openfaas.com/blog/openfaas-functions-with-github-actions/