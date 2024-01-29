#!/usr/bin/env bash

export DRONE_GITHUB_CLIENT_ID=f4ba1eef9cd1aab0c415
export DRONE_GITHUB_CLIENT_SECRET=97482db3eaf04a8a3d8e9da1adf560653e5f9238
export DRONE_GITHUB_ADMIN=Binay-Basnet
export DRONE_SERVER_HOST=9184-110-44-116-141.ngrok-free.app

export HOSTNAME=$(hostname)
export DRONE_RPC_SECRET="$(echo ${HOSTNAME} | openssl dgst -md5 -hex)"
export DRONE_USER_CREATE="username:${DRONE_GITHUB_ADMIN},machine:false,admin:true,token:${DRONE_RPC_SECRET}"
docker compose up -d
