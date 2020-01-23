Simple image, based on `Docker`, with `goss` and `dgoss` added. `goss` and `dgoss` can be used with this image to test docker containers. More info can be found on the [project github page](https://github.com/aelsabbahy/goss).
This image is based on [kiwicom/dgoss](https://hub.docker.com/r/kiwicom/dgoss/dockerfile), but we have moved the binary downloads into the repo, instead of having it as part of the Dockerfile.

# Image Usage
In the directory containing your `goss.yaml` file (and optionally `goss_wait.yaml`):
```
docker run --rm \
    -v $PWD/goss.yaml:/goss.yaml  \
    -v $PWD/goss_wait.yaml:/goss_wait.yaml \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -e GOSS_FILES_STRATEGY=cp \
    praqma/dgoss dgoss run yourImageHere:latest
```

This image is very useful for building and testing a Dockerfile on CircleCI. Here's an example:
```
jobs:
  build-and-test:
    docker:
      - image: kiwicom/dgoss
    environment:
      IMAGE_NAME: building-on-ci:ci
      GOSS_FILES_PATH: /wherever/your/goss/files/are/
      GOSS_FILES_STRATEGY: cp
    steps:
      - checkout
      - setup_remote_docker
      - run:
          name: Build Docker image
          command: |
            docker build -t $IMAGE_NAME .
      - run:
          name: Test image with dgoss
          command: dgoss run $IMAGE_NAME
```

> For an example of a production setup, see [praqma-training/code-server](https://github.com/praqma-training/code-server)

# Contributing
Any commit on `master` will automatically update `praqma/dgoss:latest`, and any new tag pushed to origin will create a named release on Docker Hub.
We do not expect this repo to be very active. If you have a suggested contribution, feel free to create a pull request.

## Updating goss version
Change the desired `GOSS_VERSION` and `DGOSS_VERSION` in `update-binaries.sh`, and execute the script locally to pull down the new versions. Commit and push.