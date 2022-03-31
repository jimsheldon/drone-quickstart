# drone-quickstart

This repository provides configuration and instructions for how to get started with [Drone CI](https://www.drone.io) from [Harness](https://harness.io)

## Prerequisites

* Comfortable running commands in the terminal
* A [GitHub](https://github.com) account
* A [ngrok](https://ngrok.com) account
* A computer that can run [amd64](https://en.wikipedia.org/wiki/X86-64) or [arm64](https://en.wikipedia.org/wiki/AArch64) [Docker](https://www.docker.com) containers (this includes the new [M1](https://en.wikipedia.org/wiki/Apple_M1)-based Macs)
  * In your terminal, verify you have `docker` and `docker-compose` commands available

## Tools used

* [Docker](https://www.docker.com) - for running the [Drone](https://docs.drone.io/server/provider/github/) and [Drone Docker Runner](https://docs.drone.io/runner/docker/overview/) processes
* [ngrok](https://ngrok.com) - creates a [tunnel](https://en.wikipedia.org/wiki/Tunneling_protocol) between your local Drone docker container and the outside world, allowing it to receive webhooks from GitHub

## Steps

### Create the tunnel

1. Login to [https://ngrok.com](https://ngrok.com)
2. Open [https://dashboard.ngrok.com/get-started/setup](https://dashboard.ngrok.com/get-started/setup), follow the steps to install the ngrok binary and connect to your account
3. Create the tunnel by running `ngrok http 8080` in your terminal, **do not stop the process** until you are finished with this guide
4. `ngrok` will create your tunnel and provide you with a URL such as `https://abcd-3fg-hij-k1-mn.ngrok.io`, make a note of it

### Create the GitHub OAuth Application

1. Follow Drone's [Create an OAuth Application](https://docs.drone.io/server/provider/github/#create-an-oauth-application) documentation
  - For the "Homepage URL", enter the `ngrok` URL from the previous step
  - For the "Authorization callback URL", enter the same `ngrok` URL, with `/login` appended
  - You will be given the "Client ID" and a "Client secret", make a note of each (the secret is only displayed once, if you misplace it, you will need to generate a new client secret)

### Start the Drone and Drone Runner processes

1. [Fork this repository](https://docs.github.com/en/get-started/quickstart/fork-a-repo) and [clone](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) the fork to your computer
2. Edit the file `run.sh`
  - Set `DRONE_GITHUB_CLIENT_ID` and `DRONE_GITHUB_CLIENT_SECRET` using the "Client ID" and "Client secret" from the previous step
  - Set `DRONE_GITHUB_ADMIN` to your GitHub username
  - Set `DRONE_SERVER_HOST` to your `ngrok` URL, without the `https://` (if your `ngrok` URL is `https://abcd-3fg-hij-k1-mn.ngrok.io`, set `DRONE_SERVER_HOST` to `abcd-3fg-hij-k1-mn.ngrok.io`)
  - Save your changes
3. Open a new terminal session and change to the directory where you checked out this repository
  - Execute `run.sh` by typing `./run.sh` and hitting enter
  - Open your `ngrok` URL in a browser, you should be greeted with "**Welcome to Drone**"! 🎉

### Activate your repository

1. Click "Continue", you will be prompted to authorize your OAuth application in your GitHub account
  - Next you should see the dashboard, if you do not see any repositories, click the "Sync" button
2. Your forked repository should now appear in the list, click the repository and then click "Activate Repository"
