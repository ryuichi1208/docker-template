FROM centos:8

RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial && \
    dnf -y install epel-release && \
    rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8 && \
    dnf -y install clamav clamav-update clamd && \
    dnf clean all

RUN sed -i -e "s/^LogSyslog /#LogSyslog /" /etc/clamd.d/scan.conf && \
    sed -i -e "s/^#LogVerbose /LogVerbose /" /etc/clamd.d/scan.conf && \
    sed -i -e "s/^#LocalSocket /LocalSocket /" /etc/clamd.d/scan.conf && \
    sed -i -e "s/^#LocalSocketGroup virusgroup/LocalSocketGroup root/" /etc/clamd.d/scan.conf && \
    sed -i -e "s/^#LocalSocketMode /LocalSocketMode /" /etc/clamd.d/scan.conf && \
    sed -i -e "s/^#TCPSocket /TCPSocket /" /etc/clamd.d/scan.conf && \
    sed -i -e "s/^User /#User /" /etc/clamd.d/scan.conf && \
    sed -i -e "s/^#ExitOnOOM /ExitOnOOM /" /etc/clamd.d/scan.conf

RUN chgrp 0 /etc/freshclam.conf /var/lib/clamav /run/clamd.scan && \
    chmod g=u /etc/freshclam.conf /var/lib/clamav /run/clamd.scan

USER 1001

CMD ["sh", "-c", "freshclam && /usr/sbin/clamd --foreground"]

EXPOSE 3310/tcp
