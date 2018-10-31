#!/bin/bash

docker run \
    -i \
    -t \
    --rm \
    --env-file env.sh \
    --name hudsucker \
    -v //var//run//docker.sock://var//run//docker.sock \
    --network host \
    --restart always \
    vsts-arm64v8-agent-proxy

