FROM debian

RUN apt-get update -y
RUN apt-get install python3 pip aptitude iputils-ping net-tools man vim openssh-server sudo -y

COPY run.sh /var/

# adjust file permissions to make run.sh executable
RUN chmod 755 /var/run.sh

RUN mkdir /var/run/sshd
# RUN mkdir /root/.ssh

# ansible user config
RUN useradd -ms /bin/bash ansible
RUN usermod -aG sudo ansible
RUN echo "ansible  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN mkdir /home/ansible/.ssh
RUN chown -R ansible /home/ansible



EXPOSE 22