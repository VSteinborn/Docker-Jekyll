# Docker-Jekyll

Local development environment for [Jekyll](https://jekyllrb.com/) sites via Docker.

# Why run Jekyll in Docker?

- To avoid setting up Jekyll each time on a new machine
- Jekyll's configuration a bit tricky, as it only works on specific versions of Ruby, according to [people's experience](https://talk.jekyllrb.com/t/error-when-executing-bundle-install/8822). This Docker file already takes care of any configuration settings for local development.
- The Docker image is relatively light (298MB). It is built on top of [Alpine Linux](https://www.alpinelinux.org/), a resource-efficient Linux distribution.

# Running the container

To run the image in your project, follow the following steps:

1. First make sure Docker engine is running and that you can use the Docker CLI, by installing [Docker Desktop](https://www.docker.com/products/docker-desktop/), for example.

2. Copy `compose.yaml` and `docker-entrypoint.sh` from this repository into the project's root directory containing your Jekyll website and your `Gemfile` (otherwise the site can't build).

```shell
cd your/project/directory/
git clone --depth 1 git@github.com:VSteinborn/Docker-Jekyll.git # get repository files from Github
ln ./Docker-Jekyll/compose.yaml . # create a symbolic link of compose.yaml in the project's root directory
ln ./Docker-Jekyll/docker-entrypoint.sh . # similarly for docker-entrypoint.sh
```

3. Run the container using docker compose up.

```shell
docker compose up
```

Using the above command, the application name will be `jekyll-dev` in Docker, the localhost's port `4000` will listen for traffic and finally, the project directory is [bind-mounted](https://docs.docker.com/storage/bind-mounts/) to the Docker container's `/site` directory.
Feel free to change the settings to your use case.

After following the above steps site should be running at `http://0.0.0.0:4000/` in the browser.

Additionally, any file changes in the project directory will update the site at `http://0.0.0.0:4000/` after reloading the page.

to stop and remove the Docker application simply run:

```shell
docker compose down
```

# References

- Credits to Bret Fisher for publishing a great [Dockerfile](https://github.com/BretFisher/jekyll-serve) for running Jekyll.
