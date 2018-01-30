`dgc` - docker-gc-plus-volumes
==============================

[![Docker Pulls](https://img.shields.io/docker/pulls/trinitronx/dgc.svg)](https://hub.docker.com/r/trinitronx/dgc)
[![Docker Stars](https://img.shields.io/docker/stars/trinitronx/dgc.svg)](https://hub.docker.com/r/trinitronx/dgc) [![](https://images.microbadger.com/badges/image/trinitronx/dgc.svg)](https://microbadger.com/images/trinitronx/dgc "Get your own image badge on microbadger.com")
[![GitHub Release](https://img.shields.io/github/release/trinitronx/docker-gc-plus-volumes.svg)](https://github.com/trinitronx/docker-gc-plus-volumes/releases)
[![Gittip](http://img.shields.io/gittip/trinitronx.svg)](https://www.gittip.com/trinitronx)

This repo is just a wrapper script & docker-compose.yml files to make docker container, image, and leftover volume cleanup easy.  Contains a couple example container & image exclude files in `etc/`.  Assumes your docker directory is `/var/lib/docker`, and that the docker daemon socket is located at `/var/run/docker.sock`.

By default, will delete **ALL** containers, images, and volumes older than 24 hours and **NOT** included in the `etc/docker-gc-exclude*` files.  The `docker-gc` and `docker-cleanup-volumes` containers & images are also deleted after run.

Usage
=====

The wrapper script only accepts a single argument:

 - **`--dry-run`**: Run both `docker-gc` and `docker-cleanup-volumes` in _**DRY RUN**_ mode.  Does not actually delete anything.
 - When run **WITHOUT** `--dry-run`, deletion occurs.

## Docker

To run the prebuilt Docker container:

    docker run  --rm -v /var/lib/docker:/var/lib/docker \
                     -v /var/run/docker.sock:/var/run/docker.sock \
                     -v $(pwd)/etc:/etc \
                trinitronx/dgc [--dry-run]

Build
=====

To build this docker image:

    docker build -t trinitronx/dgc .

License
=======

[GNU GPL v3](http://choosealicense.com/licenses/gpl-3.0/)

See LICENSE.md for full text

Copyright
=========

Copyright James Cuzella 2014-2016 ([@trinitronx][keybase-id])

Author
======

Author:: James Cuzella ([@trinitronx][keybase-id])


[keybase-id]: https://gist.github.com/trinitronx/aee110cbdf55e67185dc44272784e694
 