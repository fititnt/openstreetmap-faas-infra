#!/bin/sh
#===============================================================================
#
#          FILE:  deploy-functions.sh
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
#       CREATED:  2022-12-28T01:24:00Z
#      REVISION:  ---
#===============================================================================
# shellcheck disable=SC2317
# echo "Manual setup"
# exit 0

# See https://github.com/fititnt/openstreetmap-serverless-functions

OWNER="${OWNER:-fititnt}"
OPENFAAS_URL="${OPENFAAS_URL:-'https://osm-faas.etica.ai/'}"
OPENFAAS_USER="${OPENFAAS_USER:-'admin'}"

# echo "TODO"

# # faas-cli template store list

# faas-cli secret --help
# # See https://docs.openfaas.com/cli/secrets/

# For all options on how to deploy
faas-cli deploy --help

faas-cli deploy --image=ghcr.io/fititnt/wiki-telegram-bot:latest --secret=secret-wiki-telegram-bot-001 --name=wiki-telegram-bot
faas-cli deploy --image=ghcr.io/fititnt/wiki-as-base:latest --name=wiki-as-base
faas-cli deploy --image=ghcr.io/fititnt/api-rdf:latest --name=api-rdf