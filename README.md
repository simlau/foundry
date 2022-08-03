## Create user for running Foundry

```bash
useradd -m -s /bin/bash kermie
usermod -a -G docker kermie
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

## Configure backup job

```bash
# Login as user
su - kermie

# Configure backup job
crontab -l > cron
echo "0 0 * * WED /home/kermie/backup.sh" >> cron
crontab cron
rm cron
```
