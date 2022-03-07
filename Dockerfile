FROM linuxmintd/mint19.3-amd64
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y procps \
   libgl1 \
   libglib2.0-0 \
   xcb \
   libfontconfig1 \
   libxrender1 \
   libqt5gui5 \
   sudo

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/devops && \
    echo "devops:x:${uid}:${gid}:Developer,,,:/home/devops:/bin/bash" >> /etc/passwd && \
    echo "devops:x:${uid}:" >> /etc/group && \
    echo "devops ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers && \
    chown ${uid}:${gid} -R /home/devops

RUN echo "devops ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR /home/devops
COPY secoclient-linux-64.run /home/devops/secoclient-linux-64.run
RUN chmod +x /home/devops/secoclient-linux-64.run && chown devops: /home/devops/secoclient-linux-64.run && /home/devops/secoclient-linux-64.run
USER devops
ENV HOME /home/devops
#ENV QT_DEBUG_PLUGINS 1
RUN mkdir /home/devops/config/ && mkdir -p /home/devops/SecoClient/config/
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
