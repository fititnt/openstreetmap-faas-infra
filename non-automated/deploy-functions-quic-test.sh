#!/bin/sh
#===============================================================================
#
#          FILE:  deploy-functions-quic-test.sh
#
#         USAGE:  ./deploy-functions-quic-test.sh
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

set -e
set -x

curl -s https://osm-faas.etica.ai/function/wiki-as-base/Key:maxspeed | grep '{{KeyDescription'
curl -s https://osm-faas.etica.ai/function/wiki-as-base/Tag:highway=residential | grep '{{ValueDescription'

curl -s https://osm-faas.etica.ai/function/api-proxy/node/1 | grep '<osm version="0.6"'

curl -s https://osm-faas.etica.ai/function/api-rdf/node/1 | grep 'osmnode:1'
curl -s https://osm-faas.etica.ai/function/api-rdf/way/100 | grep 'osmway:100'
curl -s https://osm-faas.etica.ai/function/api-rdf/relation/10000 | grep 'osmrel:10000'

# Not fully implemented
curl -s https://osm-faas.etica.ai/function/wiki-telegram-bot
