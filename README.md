# lunarteam-kortex-docker
## Prerequisites
- Installed docker
## Running
After cloning this repository run the buildNRunDocker.sh or if you've already built the image run runDocker.sh.
You can do that with commands below:
~~~
bash buildNRunDocker.sh
# or
bash runDocker.sh
~~~

After that you should see a built workspace folder named lunarteam_ws. If that's not the case, something went wrong (uh oh). 

Unfortunately if you want to build lunarteam workspace you will need to log in as a root.
~~~
sudo docker start lunarteam-kortex # if container is not running already
sudo docker exec -it -u 0 lunarteam-kortex bash
~~~
Alternatively you can start the container in interactive mode and then switch to root with:
~~~
sudo docker start -i lunarteam-kortex
sudo -i # the password is 1234
~~~
If you dont want to switch between users for workspace building you can either not use vscode or use this command everytime you want to open it:
~~~
sudo code --no-sandbox --user-data-dir="~/.vscode-root"
~~~
## What's inside
The image is created from osrf/ros2-humble-desktop image and downloads:
- apt utils
- vim
- vscode
- moveit2
- kinova kortex
- gazebo ignition fortress
- packages for controlling kinova

## Links
- [kinova_gen3_control_interfaces](https://github.com/ReQ1600/kinova_gen3_control_interfaces)
- [ros2_kortex](https://github.com/Kinovarobotics/ros2_kortex)
- [moveit2](https://github.com/moveit/moveit2)
