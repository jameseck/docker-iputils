#!/bin/bash

docker rmi iputils_builder 2>/dev/null
docker build --force-rm -t iputils_builder .
docker run --rm --name iputils_builder_tmp iputils_builder bash -c "tar Ccf /tmp/deps/ - ." | docker import - iputils
docker rmi iputils_builder 2>/dev/null
