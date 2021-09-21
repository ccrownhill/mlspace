FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive
ARG HOME_DIR="/home/undefined"
ARG MNT_DIR="$HOME_DIR/loc"

RUN apt-get -y update && \
    apt-get -y --no-install-recommends upgrade && \
    apt-get install -y --no-install-recommends apt-utils software-properties-common \
      apt-transport-https ca-certificates man-db curl python3 python3-pip

RUN useradd -d $HOME_DIR --shell /bin/bash --create-home --skel /etc/skel --user-group undefined
USER undefined:undefined
WORKDIR $MNT_DIR

RUN pip3 install numpy matplotlib pandas tensorflow torch torchvision gym jupyter
