# debug-quickstart

<!-- TOC -->

- [debug-quickstart](#debug-quickstart)
    - [TL;DR:](#tldr)
    - [Global overview](#global-overview)
    - [Per topic](#per-topic)
        - [Disk](#disk)
        - [journalctl](#journalctl)
        - [Systemd services](#systemd-services)
        - [Update & Reboot](#update--reboot)
- [Testing & considering to implement](#testing--considering-to-implement)

<!-- /TOC -->

## TL;DR:

**Commands**

```bash

#### 1. Disk?
sudo df -h

#### 2. Ports?
sudo netstat -ntulp

#### 3. Systemd quick general overview

# Show any failed systemd app
sudo systemctl --failed
sudo systemctl status

#### 4. Systemd focused app overview
sudo systemctl status varnish

#### To categorize
sudo journalctl -p "emerg".."crit"
sudo journalctl -f

#### Open Ports and firewall
sudo netstat -ntulp && sudo ufw status numbered

#### Openfaas
sudo journalctl -u faasd -f
sudo journalctl -f

sudo journalctl -g overpass*
sudo journalctl -g 21:33*
sudo journalctl -g cron-connector*

```

## Global overview

<!--
### Global Cockpit
- https://example.org
- User: username

### Jumpbox
Both bravo and charlie may have direct to hosts. The same machines availible by
cockpit can also be accessed thougth rocha user.

```bash
ssh rocha@basalto-rocha.vps.fititnt.org

# Most host will have a dedicated user called alligoagent
ssh alligoagent@host
```
-->

**External references**
- https://www.cyberciti.biz/tips/top-linux-monitoring-tools.html

## Per topic

### Disk

```bash
# ...
```

- See also:
  - https://www.golinuxcloud.com/monitor-disk-io-performance-statistics-linux/

### `journalctl`
```bash
#### journalctl ________________________________________________________________

### Quick overview

journalctl -b -1 -p "emerg".."crit"

#### journalctl: specific service
#
journalctl -u nginx.service
```
- See also:
  - https://www.loggly.com/ultimate-guide/using-journalctl/

### Systemd services

```bash
sudo systemctl --failed
sudo systemctl status
```
- See also
  - https://wiki.archlinux.org/index.php/Systemd#Troubleshooting

### Update & Reboot

```
# Atualiza pacotes
apt update && apt upgrade -y

# Checa se precisa de reboot. Dee retornar algo como '*** System restart required ***'
cat /var/run/reboot-required
```

# Testing & considering to implement

```bash

#### iostat ____________________________________________________________________
# @see https://linux.die.net/man/1/iostat
```


---

> Temp

```bash
# Atualiza pacotes
apt update && apt upgrade -y

# Checa se precisa de reboot. Dee retornar algo como '*** System restart required ***'
cat /var/run/reboot-required

# Restart all
systemctl restart nginx && systemctl restart varnish && netstat -ntulp
# Error logs
multitail /var/log/nginx/access.log -I /var/log/nginx/error.log

# UFW
ufw status numbered

# Benchmark performance
ttfb -v -n 3 https://example.org/ && ttfb -v -n 3 https://example.com/

#### goaccess __________________________________________________________________
### @see https://goaccess.io/get-started
# Nota: o goaccess pode demorar um bom tempo para inicializar. Arquivo de logs
#       do portogente.com.br pode ter mais de 200mb descomprimido. Note que este
#       comando tambem usa muita CPU e deve ser usado apenas para debug avançado

sudo goaccess /var/log/nginx/access.log
```