#!/bin/bash

[[ $(whoami) != "root" ]] && echo "Please run this script as root" && exit 1

echo "Bind mounting ${GOPATH}..."
docker run --net=host -v ${GOPATH}:/home/dev/gopath -it vimdev /bin/bash
