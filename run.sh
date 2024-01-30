#!/usr/bin/env bash

export DRONE_GITHUB_CLIENT_ID=4142ebe1a0eac28cb6fc
export DRONE_GITHUB_CLIENT_SECRET=d888f06d81fb0ddb21917ab2da291e6ffde59154
export DRONE_GITHUB_ADMIN=Binay-Basnet
export DRONE_SERVER_HOST=797f-110-44-116-141.ngrok-free.app

export HOSTNAME=$(hostname)
export DRONE_RPC_SECRET="$(echo ${HOSTNAME} | openssl dgst -md5 -hex)"
export DRONE_USER_CREATE="username:${DRONE_GITHUB_ADMIN},machine:false,admin:true,token:${DRONE_RPC_SECRET}"
docker compose up -d
