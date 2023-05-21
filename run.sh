#!/usr/bin/env bash

export DRONE_GITHUB_CLIENT_ID=a2ec3a80a98661e4fac7
export DRONE_GITHUB_CLIENT_SECRET=1fdb09293274b094ba17abfa4db752412c823d4b
export DRONE_GITHUB_ADMIN=vladislav2402
export DRONE_SERVER_HOST=c8d5-194-156-250-153.ngrok-free.app

export HOSTNAME=$(hostname)
export DRONE_RPC_SECRET="$(echo ${HOSTNAME} | openssl dgst -md5 -hex)"
export DRONE_USER_CREATE="username:${DRONE_GITHUB_ADMIN},machine:false,admin:true,token:${DRONE_RPC_SECRET}"
docker-compose up -d
