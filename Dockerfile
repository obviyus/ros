FROM ros:melodic
LABEL maintainer="biblioklept@icloud.com"

RUN apt-get update --fix-missing \
    && apt-get -y install git python-pip \
    && apt-get clean \
    && sudo pip install -U catkin_tools

# Initialize catkin workspace
RUN mkdir -p ~/catkin_ws
WORKDIR ~/catkin_ws
RUN mkdir -p src

COPY . ./src/

RUN /bin/bash -c "rosdep install --from-paths src --ignore-src -r -y"