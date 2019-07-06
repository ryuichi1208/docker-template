FROM centos

RUN yum install -y gcc libffi-devel python-devel openssl-devel epel-release
RUN yum install -y openssh-server openssh-clients sshpass
RUN curl -kL https://bootstrap.pypa.io/get-pip.py | python
RUN pip install ansible[azure]
RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc
RUN sh -c 'echo -e "[azure-cli]\nname=Azure CLI\nbaseurl=https://packages.microsoft.com/yumrepos/azure-cli\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/azure-cli.repo'
RUN yum install -y azure-cli
RUN echo p@ssw0rd | passwd --stdin root
RUN sed -ri "s/#PermitRootLogin yes/PermitRootLogin yes/g" /etc/ssh/sshd_config
