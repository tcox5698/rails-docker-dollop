#!/usr/bin/env bash

docker run -itP -v $(pwd):/app tcrails
docker exec -it "bash"