#!/bin/sh

curl -s https://osm-faas.etica.ai/function/wiki-as-db/Key:maxspeed | grep '{{KeyDescription'
curl -s https://osm-faas.etica.ai/function/api-proxy/node/1 | grep '<osm version="0.6"'

curl -s https://osm-faas.etica.ai/function/api-rdf/node/1 | grep 'osmnode:1'
curl -s https://osm-faas.etica.ai/function/api-rdf/way/100 | grep 'osmway:100'
curl -s https://osm-faas.etica.ai/function/api-rdf/relation/10000 | grep 'osmrel:10000'