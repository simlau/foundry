#!/usr/bin/env bash
now=$(date +%F)
file="$now.tar.gz"
docker-compose stop foundry
tar cfzv $file /home/kermie/foundry/Data/
aws s3 cp $file "s3://fvtt-backup/$file"
docker-compose start foundry
