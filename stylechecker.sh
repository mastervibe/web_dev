#!/bin/bash

docker pull greenfox/markdown-tools:latest

docker run \
  --volume="$(pwd):/usr/tools/lint" \
  --name="md-tools" \
  --rm \
  greenfox/markdown-tools \
  /bin/sh -c "npm run stylecheck -- --quiet"
