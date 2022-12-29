#!/bin/sh
#===============================================================================
#
#          FILE:  secrets-for-functions.dist.sh
#
#         USAGE:  cat secrets-for-functions.dist.sh
#
#   DESCRIPTION:  See https://docs.openfaas.com/cli/secrets/
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha
#       COMPANY:  ---
#       LICENSE:  Public Domain
#       VERSION:  1.0
#       CREATED:  2022-12-28T01:24:00Z
#      REVISION:  ---
#===============================================================================
# shellcheck disable=SC2317
echo "Manual setup"
exit 0


# Changed for your backend
export OPENFAAS_URL=https://osm-faas.etica.ai/
export OPENFAAS_USER=admin

# Run this to the sure you're on the rigth backend (not for example your local
# machine)
faas-cli list

# This will list existing secrets (if any)
faas-cli secret list


#### Create secret _____________________________________________________________
# Please check https://docs.openfaas.com/cli/secrets/ for all options to create
# secret than this one.

faas-cli secret create secret-wiki-telegram-bot-001
# Reading from STDIN - hit (Control + D) to stop.
# <REDACTED>
# Creating secret: secret-wiki-telegram-bot-001.
# Created: 200 OK
