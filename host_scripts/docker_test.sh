#!/usr/bin/env bash

docker run -itP -v $(pwd):/app tcrails "/scriptdir/rails_test.sh"