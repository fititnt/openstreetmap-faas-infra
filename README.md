# openstreetmap-faas-infra
**Non-official OpenStreetMap™ Infrastructure as code (Ansible) used to run free hosting of Function as a Service for both mappers and linked data peers**. With ❤️, from 🇧🇷.

[![Ansible](img/vscode-ansible.png)](https://github.com/ansible/logos)
[![OpenFaas](img/openfaas-whale.png)](https://www.openfaas.com/)

> Tip: if you're here because of the functions (to run chatbot, API requests, etc), [check the function stores, the openstreetmap-serverless-functions](https://github.com/fititnt/openstreetmap-serverless-functions).

## How to run

```bash
ansible-playbook -i inventories/osmbr main.yml
```

## The actual servers for the FaaS

> See [inventories/osmbr/](inventories/osmbr/)

- FaaS endpoint: https://osm-faas.etica.ai/
- Munin: https://osm-faas.etica.ai/munin/

<!--
- https://munin.openstreetmap.org/
-->

<!--

## Test URLs
- curl https://osm-faas.etica.ai/function/nodeinfo
- curl https://osm-faas.etica.ai/function/env
- curl https://osm-faas.etica.ai/function/identicon
- curl -X POST -d 'perfect test!' https://osm-faas.etica.ai/function/sentimentanalysis


## Login

```bash
# Install the faas-cli on your machine
curl -sSL https://cli.openfaas.com | sudo sh

# Then setup the variables. Contact operator for what "<passwordhere>" is
export OPENFAAS_URL=https://osm-faas.etica.ai/
export OPENFAAS_USER=admin

## Alternative 1
 echo "<passwordhere>" > ~/faas_pass.txt
cat ~/faas_pass.txt | faas-cli login -u "$OPENFAAS_USER" --password-stdin

## Alternative 1
 export OPENFAAS_PASS="<passwordhere>"
echo "$OPENFAAS_PASS" | faas-cli login -u "$OPENFAAS_USER" --password-stdin

## all options
faas-cli help

## Then you can access all the information also via command line
faas-cli list
#    Function                      	Invocations    	Replicas
#    business-strategy-generator   	13119          	1    
#    env                           	7              	1    
#    identicon                     	3              	1    
#    nodeinfo                      	2281           	1    
#    ocr                           	2              	1    
#    sentimentanalysis             	9              	1 
#    (...)

```

## Options

```bash
faas-cli template store list

NAME                     SOURCE             DESCRIPTION
csharp                   openfaas           Classic C# template
dockerfile               openfaas           Classic Dockerfile template
go                       openfaas           Classic Golang template
java11                   openfaas           Java 11 template
java11-vert-x            openfaas           Java 11 Vert.x template
node17                   openfaas           HTTP-based Node 17 template
node16                   openfaas           HTTP-based Node 16 template
node14                   openfaas           HTTP-based Node 14 template
node12                   openfaas           HTTP-based Node 12 template
node                     openfaas           Classic NodeJS 8 template
puppeteer-nodelts        alexellis          A puppeteer template for headless Chrome
php7                     openfaas           Classic PHP 7 template
php8                     openfaas           Classic PHP 8 template
python                   openfaas           Classic Python 2.7 template
python3                  openfaas           Classic Python 3.6 template
python3-dlrs             intel              Deep Learning Reference Stack v0.4 for ML workloads
ruby                     openfaas           Classic Ruby 2.5 template
ruby-http                openfaas           Ruby 2.4 HTTP template
python27-flask           openfaas           Python 2.7 Flask template
python3-flask            openfaas           Python 3.7 Flask template
python3-flask-debian     openfaas           Python 3.7 Flask template based on Debian
python3-http             openfaas           Python 3.7 with Flask and HTTP
python3-http-debian      openfaas           Python 3.7 with Flask and HTTP based on Debian
golang-http              openfaas           Golang HTTP template
golang-middleware        openfaas           Golang Middleware template
python3-debian           openfaas           Python 3 Debian template
powershell-template      openfaas-incubator Powershell Core Ubuntu:16.04 template
powershell-http-template openfaas-incubator Powershell Core HTTP Ubuntu:16.04 template
rust                     booyaa             Rust template
crystal                  tpei               Crystal template
csharp-httprequest       distantcam         C# HTTP template
csharp-kestrel           burtonr            C# Kestrel HTTP template
vertx-native             pmlopes            Eclipse Vert.x native image template
swift                    affix              Swift 4.2 Template
lua53                    affix              Lua 5.3 Template
vala                     affix              Vala Template
vala-http                affix              Non-Forking Vala Template
quarkus-native           pmlopes            Quarkus.io native image template
perl-alpine              tmiklas            Perl language template based on Alpine image
crystal-http             koffeinfrei        Crystal HTTP template
rust-http                openfaas-incubator Rust HTTP template
bash-streaming           openfaas-incubator Bash Streaming template
cobol                    devries            COBOL Template

```
-->


## Disclaimers
<!--
TODO see https://wiki.osmfoundation.org/wiki/Trademark_Policy
-->

OpenStreetMap™ is a trademark of the OpenStreetMap Foundation, and is used with their permission.
This project is not endorsed by or affiliated with the OpenStreetMap Foundation. (via [OSMF Trademark_Policy](https://wiki.osmfoundation.org/wiki/Trademark_Policy))

Ansible logos are trademarked (via [ansible/logos](https://github.com/ansible/logos))

## License

Public domain
