# Docker-Jekyll

Local development environment for [Jekyll](https://jekyllrb.com/) sites via Docker.

# Why run Jekyll in Docker?

- To avoid setting up Jekyll each time on a new machine
- Jekyll's configuration a bit tricky, as it only works on specific versions of Ruby, according to [people's experience](https://talk.jekyllrb.com/t/error-when-executing-bundle-install/8822). This Docker file already takes care of any configuration settings for local development.
- The Docker image is relatively light (298MB). It is built on top of [Alpine Linux](https://www.alpinelinux.org/), a resource-efficient Linux distribution.

# Running the container

To run the image in a Docker container, follow the following steps:

1. First make sure Docker engine is running and that you can use the Docker CLI, by installing [Docker Desktop](https://www.docker.com/products/docker-desktop/), for example.

2. Pull the image from Docker Hub.

```shell
docker image pull victorsteinborn/jekyll-serve
```

3. Go the directory containing your Jekyll website (and your `Gemfile`, otherwise the site can't build).

```shell
cd directory/containing/project
```

4. Then run the container with the pulled image.

```shell
docker container run --name jekyll-dev -p 4000:4000 -v $(pwd):/site jekyll
```

In the above command, the container name will be `jekyll-dev`, port `4000` will listen on the container's port `4000` and finally, the project directory is [bind-mounted](https://docs.docker.com/storage/bind-mounts/) to the container's `/site` directory.
Feel free to change the settings to your use case.

After following the above steps site should be running at `http://0.0.0.0:4000/` in the browser.

Additionally, any file changes in the project directory will update the site at `http://0.0.0.0:4000/` after reloading the page.

# References

- Credits to Bret Fisher for publishing a great [Dockerfile](https://github.com/BretFisher/jekyll-serve) for running Jekyll.
