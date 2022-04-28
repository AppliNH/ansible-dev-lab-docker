FROM centos:centos7


RUN yum update -y
RUN yum install python3 python3-pip aptitude iputils-ping net-tools man vim wget openssh-server sudo -y
RUN yum install centos-release-scl-rh -y

# systemd config
WORKDIR /systemd-config
RUN wget --no-check-certificate https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl.py -O ./systemctl.py
RUN cp systemctl.py /usr/bin/systemctl

COPY run.sh /var/

# adjust file permissions to make run.sh executable
RUN chmod 755 /var/run.sh

RUN mkdir /var/run/sshd
# RUN mkdir /root/.ssh

# ansible user config
RUN useradd -ms /bin/bash ansible
RUN usermod -aG wheel ansible
RUN echo "ansible  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN mkdir /home/ansible/.ssh
RUN chown -R ansible /home/ansible

RUN ssh-keygen -A

EXPOSE 22
