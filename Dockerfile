FROM ubuntu

RUN apt-get -y update
RUN apt install -y apt-utils software-properties-common \
		apt-transport-https ca-certificates man-db curl
RUN apt-get install -y python3 python3-pip
RUN pip3 install numpy && \
		pip3 install matplotlib && \
		pip3 install tensorflow && \
		pip3 install gym && \
		pip3 install jupyter
