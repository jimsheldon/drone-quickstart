#!/usr/bin/env bash

export DRONE_GITHUB_CLIENT_ID=b79751d6eb16b50bc1ea
export DRONE_GITHUB_CLIENT_SECRET=93b14cd52551fc1f7b77652fe11283bb38307158
export DRONE_GITHUB_ADMIN=L00170155
export DRONE_SERVER_HOST=0940-176-61-33-92.eu.ngrok.io

export HOSTNAME=$(hostname)
export DRONE_RPC_SECRET="$(echo ${HOSTNAME} | openssl dgst -md5 -hex)"
export DRONE_USER_CREATE="username:${DRONE_GITHUB_ADMIN},machine:false,admin:true,token:${DRONE_RPC_SECRET}"
docker-compose up -d
