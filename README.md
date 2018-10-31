# Azure DevOps arm64v8 Docker Build Agent

## Creating an arm64v8 docker build agent via the arm32v7 agent

This container leverages the existing [Dockerfile.template](https://github.com/Microsoft/vsts-agent-docker/blob/master/ubuntu/Dockerfile.template) and [start.sh](https://github.com/Microsoft/vsts-agent-docker/blob/master/ubuntu/start.sh) scripts from the vsts-agent-docker repo.

Tweaking the start.sh for a couple of arm changes, we have a container that can run the minimum Azure DevOps build agent. From there, Moby is installed in the base `Dockerfile`, and on running we mount the docker socket into the container. This mount gives us access to the host Docker daemon from inside container. When the Docker build tasks are run, they are now run in the `arm64v8` host OS.
