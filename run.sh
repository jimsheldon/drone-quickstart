#!/usr/bin/env bash

export DRONE_GITHUB_CLIENT_ID=28b5f6e00b51d22fc177
export DRONE_GITHUB_CLIENT_SECRET=22defd27fa5b569c06b3a08de2c217e68cdfa608
export DRONE_GITHUB_ADMIN=ivanpap18
export DRONE_SERVER_HOST=2c71-154-50-4-62.ngrok.io 

export HOSTNAME=$(hostname)
export DRONE_RPC_SECRET="$(echo ${HOSTNAME} | openssl dgst -md5 -hex)"
export DRONE_USER_CREATE="username:${DRONE_GITHUB_ADMIN},machine:false,admin:true,token:${DRONE_RPC_SECRET}"
docker-compose up -d
