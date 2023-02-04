#!/usr/bin/env bash
now=$(date +%F)
file="$now.tar.gz"
docker-compose stop foundry
tar cfzv $file /home/simlau/foundry/Data/
mv $file /mnt/volume_lon1_01/backup/
docker-compose start foundry
