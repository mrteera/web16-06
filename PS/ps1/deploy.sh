#!/bin/bash

cp ../../proxy ~/.ssh/config
sed -i "s#image: {}#image: $REPO:$COMMIT#g" docker-compose.production.yml
scp docker-compose.production.yml $STAGING_USERNAME:$STAGING_DEPLOY_PATH
