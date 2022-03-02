FROM debian


RUN apt-get update -y
RUN apt-get install python3 pip aptitude iputils-ping net-tools man vim openssh-server -y


# ensure that required directories are created
RUN mkdir /var/run/sshd
RUN mkdir /root/.ssh

RUN mkdir /var/ansible_keys

RUN pip install ansible


# generate RSA key pair to allow master to communicate with managed nodes
# default private key passphrase is '12345' (not a good idea for production environment ;)
RUN ssh-keygen -t rsa -N 12345 -C "master key" -f /var/ansible_keys/master_key
