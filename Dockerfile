FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive
ARG USER_NAME="undefined"
ARG HOME_DIR="/home/$USER_NAME"
ARG MNT_DIR="$HOME_DIR/loc"

ENV PATH="$HOME_DIR/.local/bin:$PATH"

RUN apt-get -y update && \
    apt-get -y --no-install-recommends upgrade && \
    apt-get install -y --no-install-recommends man-db sudo python3 python3-pip \
      jupyter-notebook vim

EXPOSE 8888

RUN useradd --home-dir $HOME_DIR --shell /bin/bash --create-home --skel /etc/skel --user-group $USER_NAME
RUN usermod -append --groups sudo $USER_NAME
RUN echo "$USER_NAME ALL=(ALL:ALL) NOPASSWD:ALL" >> /etc/sudoers # use sudo without password

USER $USER_NAME:$USER_NAME
WORKDIR $MNT_DIR

RUN pip3 install tensorflow torch torchvision gym matplotlib pandas

ENTRYPOINT ["jupyter-notebook", "--ip", "0.0.0.0", "--no-browser"]
