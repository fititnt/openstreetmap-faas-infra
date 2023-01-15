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
# OPENFAAS_URL="${OPENFAAS_URL:-'https://osm-faas.etica.ai/'}"
export OPENFAAS_URL=https://osm-faas.etica.ai/
OPENFAAS_USER="${OPENFAAS_USER:-'admin'}"

# echo "TODO"

# # faas-cli template store list

# faas-cli secret --help
# # See https://docs.openfaas.com/cli/secrets/

# For all options on how to deploy
faas-cli deploy --help

faas-cli deploy --image=ghcr.io/fititnt/wiki-telegram-bot:latest --secret=secret-wiki-telegram-bot-001 --name=wiki-telegram-bot

faas-cli deploy --image=ghcr.io/fititnt/wiki-telegram-chatbot:latest --secret=secret-wiki-telegram-chatbot-002 --env TELEGRAM_BOT_FILE_TOKEN='secret-wiki-telegram-chatbot-002' --name=wiki-telegram-chatbot

faas-cli deploy --image=ghcr.io/fititnt/okmapabot:latest --secret=secret-okmapabot-telegram-token --secret=secret-okmapabot-telegram-apisecret --env TELEGRAM_BOT_TOKEN_FILE='secret-okmapabot-telegram-token' --env TELEGRAM_BOT_APISECRET_FILE='secret-okmapabot-telegram-apisecret' --name=okmapabot

faas-cli deploy --image=ghcr.io/fititnt/overpass-proxy:latest --name=overpass-proxy
faas-cli deploy --image=ghcr.io/fititnt/wiki-as-base:latest --name=wiki-as-base
faas-cli deploy --image=ghcr.io/fititnt/api-rdf:latest --name=api-rdf

# @see https://github.com/openfaas/cron-connector

faas-cli store deploy nodeinfo --name nodeinfo-cron-5min \
  --annotation schedule="*/5 * * * *" \
  --annotation topic=cron-function