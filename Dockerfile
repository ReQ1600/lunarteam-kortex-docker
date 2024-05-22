From osrf/ros:humble-desktop
RUN useradd -ms /bin/bash -g root -G sudo wedlina100pmiesa -p "$(openssl passwd -1 1234)" \
&& usermod -aG sudo wedlina100pmiesa

RUN apt-get update && apt-get install -y \
   apt-utils \
   vim

RUN sudo sudo apt install software-properties-common apt-transport-https wget -y
RUN wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
RUN sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
RUN sudo apt install code -y

RUN sudo apt install ros-humble-moveit -y
RUN apt-get update

RUN sudo apt install -y ros-humble-kortex-bringup
RUN sudo apt install -y ros-humble-kinova-gen3-7dof-robotiq-2f-85-moveit-config
RUN sudo apt install -y ros-humble-rmw-cyclonedds-cpp
RUN export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

RUN apt-get install -y wget
RUN sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
RUN wget http://packages.osrfoundation.org/gazebo.key -O - | apt-key add -

RUN apt-get update
RUN apt-get install ignition-fortress -y


WORKDIR /home/wedlina100pmiesa
RUN mkdir -p lunarteam_ws/src
WORKDIR /home/wedlina100pmiesa/lunarteam_ws/src
RUN git clone https://github.com/ReQ1600/kinova_gen3_control_cpp \
&& git clone https://github.com/ReQ1600/kinova_gen3_control_interfaces

RUN . /opt/ros/humble/setup.sh \
&& rosdep update \
&& cd /home/wedlina100pmiesa/lunarteam_ws \
&& sudo rosdep install --ignore-src --from-paths src -y -r \
&& colcon build

USER wedlina100pmiesa
WORKDIR /home/wedlina100pmiesa
