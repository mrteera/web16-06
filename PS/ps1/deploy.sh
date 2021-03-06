#!/bin/bash

cp ../../.travis/proxy ~/.ssh/config
mv ../../.travis/web16_deploy_key ~/.ssh/id_rsa
chmod 400 ~/.ssh/id_rsa
sed -i "s#image: {}#image: $REPO:$COMMIT#g" docker-compose.production.yml
scp docker-compose.production.yml $STAGING_USERNAME:/home/web6/web16-06-docker/PS/ps1/
pip install fabric
fab staging deploy
