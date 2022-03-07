docker run -v /dev/:/dev/ -v /sys/:/sys/ -v /tmp/.X11-unix/:/tmp/.X11-unix/ -e DISPLAY=$DISPLAY --privileged --network=host -it seco:mint
