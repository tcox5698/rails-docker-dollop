#!/usr/bin/env bash

docker run -itP -v $(pwd):/app tcrails "/scriptdir/copy_project.sh"