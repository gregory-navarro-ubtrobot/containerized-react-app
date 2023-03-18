FROM osrf/ros:humble-desktop

WORKDIR /app

#install ros packages
RUN apt-get update 
RUN apt-get install -y ros-humble-ros-base ros-humble-rosbridge-server
# launch the rosbridge server
# RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
# CMD ["sh", "-c", "ros2", "launch", "rosbridge_server", "rosbridge_websocket_launch.xml"] 
CMD ["ros2", "launch", "rosbridge_server", "rosbridge_websocket_launch.xml"] 


# command to build image
# docker build -t local/ros2-dev:latest -f ros2_dev.dockerfile .
# docker run -it -p 9090:9090 local/ros2-dev          