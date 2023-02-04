## Setup 

```bash
apt update
apt upgrade
apt install docker.io
apt install docker-compose
apt install apache2-utils
```


## Add A records for

- traefik.simlau.dk
- ddb-proxy.simlau.dk
- foundry.simlau.dk


## Create user for running Foundry

```bash
useradd -m -s /bin/bash simlau
usermod -a -G docker simlau
```

## Configure Traefik

```
mkdir -p traefik
cd traefik

# Add empty file for Lets Encrypt
touch acme.json
chmod 600 acme.json
```

## Configure user for Traefik dashboard

Run `htpasswd -nb admin PASSWORD`.

Set user and password for Traefik, note the extra `$` in front of the encrypted password.

```bash
traefik.http.middlewares.authtraefik.basicauth.users=admin:$$encrypted
```

## Start foundry

```bash
docker-compose start foundry
```


## Configure backup job

```bash
# Login as user
su - kermie

# Configure backup job
crontab -l > cron
echo "0 0 * * WED /home/simlau/backup.sh" >> cron
crontab cron
rm cron
```
