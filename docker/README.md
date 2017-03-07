# Docker Sandbox Local

## Initial setup

### Docker setup

1. Install [Docker](https://www.docker.com/products/docker), on macOS get **Docker for Mac**
2. Go to the **Docker menu**, select **Preferences**
3. Click on the **Advanced** tab
4. Increase memory to **8 GB** (if you have 16 GB physical memory)
5. Click **Apply & Restart**
6. Click on the **Daemon** tab
7. Add `dtr01.us.ad.westfield.com` to **Insecure registries**
8. Click **Apply & Restart**

### POW setup

```
curl get.pow.cx | sh
mkdir -p ~/.pow
echo http://localhost:4502 > ~/.pow/author
echo http://localhost:4503 > ~/.pow/publisher
echo http://localhost:81 > ~/.pow/cms
echo http://localhost:81 > ~/.pow/www-us
echo http://localhost:81 > ~/.pow/www-uk
echo http://localhost:81 > ~/.pow/www-au
echo http://localhost:81 > ~/.pow/www-nz
echo http://localhost:8000 > ~/.pow/splunk
```

### Login to docker registry

You must login to the docker registry hosted by Ops to be able to pull our pre-made hosted images of AEM.

```
docker login dtr01.us.ad.westfield.com
```

Ask Ops for username/password.

### Repo setup

1. `cd ~/src` # or wherever you keep source code
2. `git clone git@github.com:westfield/docker_sandbox_local.git`
3. `cd docker_sandbox_local`
4. `docker-compose pull` # to get the pre-built images
  - Run this command on *wired* ethernet
  - This process will take a long time the first time it is run

## Usage

From within the docker_sandbox_local directory run `docker-compose up -d`.

You can use the following URLs to access AEM:

- Author: http://author.dev
- Publisher: http://publisher.dev
- US: http://www-us.dev
- AU: http://www-au.dev
- UK: http://www-uk.dev
- NZ: http://www-nz.dev
- Splunk: http://splunk.dev user/pass `westfield:westfield`


To stop and remove all of your containers run `docker-compose down`.

*If you don't stop and remove your containers when not using your sandbox, you could potentially run out of system resources and slow your computer or kill the battery.*

To get the latest images run `docker-compose pull`.

To do a traditional full deploy, run:

```
mvn -Pbuild-test-frontend,install-pub-full -Dpublish.crx.host=publisher.dev -Dpublish.crx.port=80 clean install
mvn -Pbuild-test-frontend,install-full -Dcrx.host=author.dev -Dcrx.port=80 clean install
```

## Logs

### Splunk

1. To view the logs of your AEM servers, login to Splunk at: `http://splunk.dev`
2. Login with the credentials: `westfield/westfield`
3. Click `Seach and Reporting` on the left bar
4. In the search bar of Splunk that appears, type `index=*` and change the time window on the right from `today` to `All-time (real-time)`
5. Now as you click around in AEM, you will see logs appear in Splunk

### Docker stdout/stderr

1. `docker-compose logs -f`


## Things to note

Data on docker containers is ephemeral, meaning it is not written to disk. When you stop or remove your containers, all data not contained in the base images are lost.

## Helpful docker commands

### docker

- `docker ps`
- `docker rm -f $(docker ps -a -q)`
- `docker rmi $(docker images -q --filter "dangling=true")`
- `docker exec -it <containerid> <command>`
- `docker kill <containerid>`

### docker-compose

- `docker-compose up`
- `docker-compose up -d`
- `docker-compose pull`
- `docker-compose down`
- `docker-compose kill`

### Resize machine image

1. `brew install qemu`
2. `qemu-img resize ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2 +100G`
3. Restart Docker
4. Check the disk space in the Docker VM:
  1. `screen ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/tty`
  2. Log-in with `root` and no password
  3. `df -h` # look at the size of /var
  4. `exit`
  5. Ctrl-a-d

### Docker command completion

1. `brew tap homebrew/completions`
2. `brew install bash-completion docker-completion docker-compose-completion`
