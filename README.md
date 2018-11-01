# Azure DevOps arm64v8 Docker Build Agent

## Creating an arm64v8 docker build agent via the arm32v7 agent

This container leverages the existing [Dockerfile.template](https://github.com/Microsoft/vsts-agent-docker/blob/master/ubuntu/Dockerfile.template) and [start.sh](https://github.com/Microsoft/vsts-agent-docker/blob/master/ubuntu/start.sh) scripts from the vsts-agent-docker repo adapting them to support arm.

The official readme has more information on [how to use these images](https://github.com/Microsoft/vsts-agent-docker#how-to-use-these-images).

| File | Description |
|---|---|
| Dockerfile | This script is a slightly modified Dockerfile from the Azure DevOps agent. |
| build.sh   | Builds the docker image. You'll want to modify this file to include your container registry prefix. |
| env.sh     | This file is used for kicking off the container and contains options for the agent. The official readme has more information on the values |
| install-moby.sh | Installs the arm32v7 Moby engine and command line into the container. This is loaded into the docker build context and executed. |
| run-container-host.sh | Starts the built image and runs the container with the appropriate parameters to keep the agent running. You will want to edit this file to give your container a useful name for your purpososes. |
| start.sh   | This file is executed inside the container to configure, download, and run the built agent. |

## Notes

Tweaking the start.sh for a couple of arm changes, we have a container that can run the minimum Azure DevOps build agent. From there, Moby is installed in the base `Dockerfile`, and on running we mount the docker socket into the container. This mount gives us access to the host Docker daemon from inside container. When the Docker build tasks are run, they are now run in the `arm64v8` host OS.

Instead of installing Moby, one can also mount the docker binary (`/usr/bin/docker`) into the container, but you'll still need the socket as well.

If you decide to not mount the docker socket, the container is an arm32v7 agent and you can use as a base for adding more build features.
