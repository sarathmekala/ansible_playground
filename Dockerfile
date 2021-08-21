FROM ubuntu:latest

MAINTAINER Sarath Chandra Mekala "https://github.com/sarathmekala"

RUN apt-get update

RUN apt-get install -y software-properties-common
RUN apt-add-repository --yes --update ppa:ansible/ansible 
RUN apt-get install -y ansible iputils-ping python-apt vim \
    curl openssh-server net-tools && \
    mkdir /var/run/sshd && \
    # change the root password to 'root123'
    echo 'root:root123' |chpasswd && \
    sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    mkdir /root/.ssh/ 

ADD id_rsa /root/.ssh

COPY id_rsa.pub /root/.ssh/authorized_keys

RUN chmod 400 /root/.ssh/id_rsa && \
    chmod 400 /root/.ssh/authorized_keys

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/usr/sbin/sshd", "-D"]
