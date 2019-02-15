[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)](https://linuxserver.io)

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring :-

 * regular and timely application updates
 * easy user mappings (PGID, PUID)
 * custom base image with s6 overlay
 * weekly base OS updates with common layers across the entire LinuxServer.io ecosystem to minimise space usage, down time and bandwidth
 * regular security updates

Find us at:
* [Discord](https://discord.gg/YWrKVTn) - realtime support / chat with the community and the team.
* [IRC](https://irc.linuxserver.io) - on freenode at `#linuxserver.io`. Our primary support channel is Discord.
* [Blog](https://blog.linuxserver.io) - all the things you can do with our containers including How-To guides, opinions and much more!
* [Podcast](https://anchor.fm/linuxserverio) - on hiatus. Coming back soon (late 2018).

# PSA: Changes are happening

From August 2018 onwards, Linuxserver are in the midst of switching to a new CI platform which will enable us to build and release multiple architectures under a single repo. To this end, existing images for `arm64` and `armhf` builds are being deprecated. They are replaced by a manifest file in each container which automatically pulls the correct image for your architecture. You'll also be able to pull based on a specific architecture tag.

TLDR: Multi-arch support is changing from multiple repos to one repo per container image.

# [linuxserver/duplicati](https://github.com/linuxserver/docker-duplicati)
[![](https://img.shields.io/discord/354974912613449730.svg?logo=discord&label=LSIO%20Discord&style=flat-square)](https://discord.gg/YWrKVTn)
[![](https://images.microbadger.com/badges/version/linuxserver/duplicati.svg)](https://microbadger.com/images/linuxserver/duplicati "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/linuxserver/duplicati.svg)](https://microbadger.com/images/linuxserver/duplicati "Get your own version badge on microbadger.com")
![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/duplicati.svg)
![Docker Stars](https://img.shields.io/docker/stars/linuxserver/duplicati.svg)
[![Build Status](https://ci.linuxserver.io/buildStatus/icon?job=Docker-Pipeline-Builders/docker-duplicati/master)](https://ci.linuxserver.io/job/Docker-Pipeline-Builders/job/docker-duplicati/job/master/)
[![](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/duplicati/latest/badge.svg)](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/duplicati/latest/index.html)

[Duplicati](https://www.duplicati.com/) works with standard protocols like FTP, SSH, WebDAV as well as popular services like Microsoft OneDrive, Amazon Cloud Drive & S3, Google Drive, box.com, Mega, hubiC and many others.

[![duplicati](https://github.com/linuxserver/docker-templates/raw/master/linuxserver.io/img/duplicati-icon.png)](https://www.duplicati.com/)

## Supported Architectures

Our images support multiple architectures such as `x86-64`, `arm64` and `armhf`. We utilise the docker manifest for multi-platform awareness. More information is available from docker [here](https://github.com/docker/distribution/blob/master/docs/spec/manifest-v2-2.md#manifest-list). 

Simply pulling `linuxserver/duplicati` should retrieve the correct image for your arch, but you can also pull specific arch images via tags.

The architectures supported by this image are:

| Architecture | Tag |
| :----: | --- |
| x86-64 | amd64-latest |
| arm64 | arm64v8-latest |
| armhf | arm32v6-latest |


## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=duplicati \
  -e PUID=1001 \
  -e PGID=1001 \
  -e TZ=Europe/London \
  -p 8200:8200 \
  -v </path/to/appdata/config>:/config \
  -v </path/to/backups>:/backups \
  -v </path/to/source>:/source \
  --restart unless-stopped \
  linuxserver/duplicati
```

Using tags, you can switch between the beta and canary releases of Duplicati. No tag is required for the latest beta release.  
Add the `development` tag, if required, to the `linuxserver/duplicati` line of the run/create command in the following format, `linuxserver/duplicati:development`.  
The development tag will be the latest canary release of Duplicati.  
HOWEVER, USE THE DEVELOPMENT TAG AT YOUR OWN PERIL !!!!!!!!!


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
      - PUID=1001
      - PGID=1001
      - TZ=Europe/London
    volumes:
      - </path/to/appdata/config>:/config
      - </path/to/backups>:/backups
      - </path/to/source>:/source
    ports:
      - 8200:8200
    mem_limit: 4096m
    restart: unless-stopped
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 8200` | http gui |
| `-e PUID=1001` | for UserID - see below for explanation |
| `-e PGID=1001` | for GroupID - see below for explanation |
| `-e TZ=Europe/London` | Specify a timezone to use EG Europe/London |
| `-v /config` | Contains all relevant configuration files. |
| `-v /backups` | Path to store local backups. |
| `-v /source` | Path to source for files to backup. |

## User / Group Identifiers

When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1001` and `PGID=1001`, to find yours use `id user` as below:

```
  $ id username
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
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
* Update the image: `docker-compose pull linuxserver/duplicati`
* Let compose update containers as necessary: `docker-compose up -d`
* You can also remove the old dangling images: `docker image prune`

## Versions

* **13.01.19:** - Use jq instead of awk in dockerfiles.
* **11.01.19:** - Multi-arch image.
* **09.12.17:** - Fix continuation lines.
* **31.08.17:** - Build only beta or release versions (thanks deasmi).
* **24.04.17:** - Initial release.
