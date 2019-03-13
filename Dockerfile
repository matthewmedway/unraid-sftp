FROM ubuntu:18.04

MAINTAINER Matthew Medway

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" \
 -o Dpkg::Options::="--force-confold" install mysecureshell whois procps openssh-server perl
RUN apt-get clean
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN chmod 4755 /usr/bin/mysecureshell

VOLUME [ "/data" ]

ADD sshd_config /etc/ssh/sshd_config
ADD sftp_config /etc/ssh/sftp_config
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
RUN usermod -u 99 nobody

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]