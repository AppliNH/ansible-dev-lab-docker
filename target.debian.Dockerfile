FROM debian

RUN apt-get update -y
RUN apt-get install python3 pip aptitude iputils-ping net-tools man vim openssh-server -y

COPY run.sh /var/

# adjust file permissions to make run.sh executable
RUN chmod 755 /var/run.sh


# ensure that required directories are created
RUN mkdir /var/run/sshd
RUN mkdir /root/.ssh

EXPOSE 22