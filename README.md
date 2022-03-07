Add secoclient-linux-64.run to folder
Edit myconnection.ini  sysconfig.ini replace CONN_* variables

```bash
docker build -t secovpnclient .

docker run --name seco -v $(pwd)/sysconfig.ini:/home/devops/SecoClient/sysconfig.ini -v $(pwd)/myconnection.ini:/home/devops/SecoClient/config/myconnection.ini -v /dev/:/dev/ -v /tmp/.X11-unix/:/tmp/.X11-unix/ -e DISPLAY=$DISPLAY --privileged --network=host secovpnclient
```
