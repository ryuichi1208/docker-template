FROM centos:7

RUN yum -y install epel-release  && \
    yum -y install bash wget unzip \
           pexpect python-daemon  bubblewrap gcc \
           bzip2  openssh openssh-clients python2-psutil\
           python36 python36-devel python36-setuptools\
           nginx supervisor && \
           localedef -c -i en_US -f UTF-8 en_US.UTF-8
RUN easy_install-3.6 -d /usr/lib/python3.6/site-packages pip && \
    ln -s /usr/lib/python3.6/site-packages/pip3 /usr/local/bin/pip3

RUN /usr/local/bin/pip3 install ansible cryptography docutils psutil PyYAML \
                 pyOpenSSL flask flask-restful uwsgi netaddr notario && \
    /usr/local/bin/pip3 install --no-cache-dir ansible-runner==1.3.2 && \
    rm -rf /var/cache/yum
RUN mkdir -p /etc/ansible-runner-service && \
    mkdir -p /root/.ssh && \
    mkdir -p /usr/share/ansible-runner-service/{artifacts,env,project,inventory,client_cert}
WORKDIR /root
