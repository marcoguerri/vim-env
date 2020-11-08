#!/bin/bash

[[ $(whoami) != "root" ]] && echo "Please run this script as root" && exit 1

docker run --net=host -it vimdev /bin/bash
