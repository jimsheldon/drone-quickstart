#!/usr/bin/env bash

export DRONE_GITHUB_CLIENT_ID=
export DRONE_GITHUB_CLIENT_SECRET=
export DRONE_GITHUB_ADMIN=
export DRONE_SERVER_HOST=

export HOSTNAME=$(hostname)
export DRONE_RPC_SECRET="$(echo ${HOSTNAME} | openssl dgst -md5 -hex)"
export DRONE_USER_CREATE="username:${DRONE_GITHUB_ADMIN},machine:false,admin:true,token:${DRONE_RPC_SECRET}"
docker-compose up -d
