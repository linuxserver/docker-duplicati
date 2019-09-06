[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)](https://linuxserver.io)

[![Blog](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=Blog)](https://blog.linuxserver.io "all the things you can do with our containers including How-To guides, opinions and much more!")
[![Discord](https://img.shields.io/discord/354974912613449730.svg?style=flat-square&color=E68523&label=Discord&logo=discord&logoColor=FFFFFF)](https://discord.gg/YWrKVTn "realtime support / chat with the community and the team.")
[![Discourse](https://img.shields.io/discourse/https/discourse.linuxserver.io/topics.svg?style=flat-square&color=E68523&logo=discourse&logoColor=FFFFFF)](https://discourse.linuxserver.io "post on our community forum.")
[![Fleet](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=Fleet)](https://fleet.linuxserver.io "an online web interface which displays all of our maintained images.")
[![Podcast](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=Podcast)](https://anchor.fm/linuxserverio "on hiatus. Coming back soon (late 2018).")
[![Open Collective](https://img.shields.io/opencollective/all/linuxserver.svg?style=flat-square&color=E68523&label=Open%20Collective%20Supporters)](https://opencollective.com/linuxserver "please consider helping us by either donating or contributing to our budget")

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring :-

 * regular and timely application updates
 * easy user mappings (PGID, PUID)
 * custom base image with s6 overlay
 * weekly base OS updates with common layers across the entire LinuxServer.io ecosystem to minimise space usage, down time and bandwidth
 * regular security updates

Find us at:
* [Blog](https://blog.linuxserver.io) - all the things you can do with our containers including How-To guides, opinions and much more!
* [Discord](https://discord.gg/YWrKVTn) - realtime support / chat with the community and the team.
* [Discourse](https://discourse.linuxserver.io) - post on our community forum.
* [Fleet](https://fleet.linuxserver.io) - an online web interface which displays all of our maintained images.
* [Podcast](https://anchor.fm/linuxserverio) - on hiatus. Coming back soon (late 2018).
* [Open Collective](https://opencollective.com/linuxserver) - please consider helping us by either donating or contributing to our budget

# [linuxserver/duplicati](https://github.com/linuxserver/docker-duplicati)
[![GitHub Release](https://img.shields.io/github/release/linuxserver/docker-duplicati.svg?style=flat-square&color=E68523)](https://github.com/linuxserver/docker-duplicati/releases)
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/linuxserver/duplicati.svg?style=flat-square&color=E68523)](https://microbadger.com/images/linuxserver/duplicati "Get your own version badge on microbadger.com")
[![MicroBadger Size](https://img.shields.io/microbadger/image-size/linuxserver/duplicati.svg?style=flat-square&color=E68523)](https://microbadger.com/images/linuxserver/duplicati "Get your own version badge on microbadger.com")
[![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/duplicati.svg?style=flat-square&color=E68523)](https://hub.docker.com/r/linuxserver/duplicati)
[![Docker Stars](https://img.shields.io/docker/stars/linuxserver/duplicati.svg?style=flat-square&color=E68523)](https://hub.docker.com/r/linuxserver/duplicati)
[![Build Status](https://ci.linuxserver.io/view/all/job/Docker-Pipeline-Builders/job/docker-duplicati/job/master/badge/icon?style=flat-square)](https://ci.linuxserver.io/job/Docker-Pipeline-Builders/job/docker-duplicati/job/master/)
[![](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/duplicati/latest/badge.svg)](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/duplicati/latest/index.html)

[Duplicati](https://www.duplicati.com/) works with standard protocols like FTP, SSH, WebDAV as well as popular services like Microsoft OneDrive, Amazon Cloud Drive & S3, Google Drive, box.com, Mega, hubiC and many others.

[![duplicati](https://github.com/linuxserver/docker-templates/raw/master/linuxserver.io/img/duplicati-icon.png)](https://www.duplicati.com/)

## Supported Architectures

Our images support multiple architectures such as `x86-64`, `arm64` and `armhf`. We utilise the docker manifest for multi-platform awareness. More information is available from docker [here](https://github.com/docker/distribution/blob/master/docs/spec/manifest-v2-2.md#manifest-list) and our announcement [here](https://blog.linuxserver.io/2019/02/21/the-lsio-pipeline-project/).

Simply pulling `linuxserver/duplicati` should retrieve the correct image for your arch, but you can also pull specific arch images via tags.

The architectures supported by this image are:

| Architecture | Tag |
| :----: | --- |
| x86-64 | amd64-latest |
| arm64 | arm64v8-latest |
| armhf | arm32v7-latest |

## Version Tags

This image provides various versions that are available via tags. `latest` tag usually provides the latest stable version. Others are considered under development and caution must be exercised when using them.

| Tag | Description |
| :----: | --- |
| latest | Beta releases of Duplicati |
| development | Canary releases of Duplicati |

## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=duplicati \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -e CLI_ARGS= `#optional` \
  -p 8200:8200 \
  -v </path/to/appdata/config>:/config \
  -v </path/to/backups>:/backups \
  -v </path/to/source>:/source \
  --restart unless-stopped \
  linuxserver/duplicati
```


### docker-compose

Compatible with docker-compose v2 schemas.

```
---
version: "2"
services:
  duplicati:
    image: linuxserver/duplicati
    container_name: duplicati
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/London
      - CLI_ARGS= #optional
    volumes:
      - </path/to/appdata/config>:/config
      - </path/to/backups>:/backups
      - </path/to/source>:/source
    ports:
      - 8200:8200
    restart: unless-stopped
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 8200` | http gui |
| `-e PUID=1000` | for UserID - see below for explanation |
| `-e PGID=1000` | for GroupID - see below for explanation |
| `-e TZ=Europe/London` | Specify a timezone to use EG Europe/London |
| `-e CLI_ARGS=` | Optionally specify any [CLI variables](https://duplicati.readthedocs.io/en/latest/07-other-command-line-utilities/) you want to launch the app with |
| `-v /config` | Contains all relevant configuration files. |
| `-v /backups` | Path to store local backups. |
| `-v /source` | Path to source for files to backup. |

## User / Group Identifiers

When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1000` and `PGID=1000`, to find yours use `id user` as below:

```
  $ id username
    uid=1000(dockeruser) gid=1000(dockergroup) groups=1000(dockergroup)
```


&nbsp;
## Application Setup

The webui is at `<your ip>:8200` , create backup jobs etc via the webui, for local backups select `/backups` as the destination. For more information see [Duplicati](https://www.duplicati.com/).



## Support Info

* Shell access whilst the container is running: `docker exec -it duplicati /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f duplicati`
* container version number
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' duplicati`
* image version number
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/duplicati`

## Updating Info

Most of our images are static, versioned, and require an image update and container recreation to update the app inside. With some exceptions (ie. nextcloud, plex), we do not recommend or support updating apps inside the container. Please consult the [Application Setup](#application-setup) section above to see if it is recommended for the image.

Below are the instructions for updating containers:

### Via Docker Run/Create
* Update the image: `docker pull linuxserver/duplicati`
* Stop the running container: `docker stop duplicati`
* Delete the container: `docker rm duplicati`
* Recreate a new container with the same docker create parameters as instructed above (if mapped correctly to a host folder, your `/config` folder and settings will be preserved)
* Start the new container: `docker start duplicati`
* You can also remove the old dangling images: `docker image prune`

### Via Docker Compose
* Update all images: `docker-compose pull`
  * or update a single image: `docker-compose pull duplicati`
* Let compose update all containers as necessary: `docker-compose up -d`
  * or update a single container: `docker-compose up -d duplicati`
* You can also remove the old dangling images: `docker image prune`

### Via Watchtower auto-updater (especially useful if you don't remember the original parameters)
* Pull the latest image at its tag and replace it with the same env variables in one run:
  ```
  docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  containrrr/watchtower \
  --run-once duplicati
  ```

**Note:** We do not endorse the use of Watchtower as a solution to automated updates of existing Docker containers. In fact we generally discourage automated updates. However, this is a useful tool for one-time manual updates of containers where you have forgotten the original parameters. In the long term, we highly recommend using Docker Compose.

* You can also remove the old dangling images: `docker image prune`

## Building locally

If you want to make local modifications to these images for development purposes or just to customize the logic:
```
git clone https://github.com/linuxserver/docker-duplicati.git
cd docker-duplicati
docker build \
  --no-cache \
  --pull \
  -t linuxserver/duplicati:latest .
```

The ARM variants can be built on x86_64 hardware using `multiarch/qemu-user-static`
```
docker run --rm --privileged multiarch/qemu-user-static:register --reset
```

Once registered you can define the dockerfile to use with `-f Dockerfile.aarch64`.

## Versions

* **01.08.19:** - Rebase to Linuxserver LTS mono version.
* **16.07.19:** - Allow for additional command line arguments in an environment variable.
* **28.06.19:** - Rebase to bionic.
* **23.03.19:** - Switching to new Base images, shift to arm32v7 tag.
* **28.02.19:** - Allow access from all hostnames, clarify info on image tags.
* **13.01.19:** - Use jq instead of awk in dockerfiles.
* **11.01.19:** - Multi-arch image.
* **09.12.17:** - Fix continuation lines.
* **31.08.17:** - Build only beta or release versions (thanks deasmi).
* **24.04.17:** - Initial release.
