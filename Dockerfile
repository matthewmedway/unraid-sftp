FROM ubuntu:18.04

ARG password
ARG username
ARG publickey

MAINTAINER Matthew Medway

RUN echo "Credentials: ${password} ${username}"
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" \
 -o Dpkg::Options::="--force-confold" install mysecureshell whois procps openssh-server
RUN apt-get clean
RUN mkdir /var/run/sshd
RUN mkdir /data
RUN pass=$(mkpasswd -m sha-512 -s ${password}) && useradd -m -s /usr/bin/mysecureshell -p $pass ${username} -d /data
RUN echo 'root:root' | chpasswd
RUN chmod 4755 /usr/bin/mysecureshell
RUN mkdir -p /sshkeys/${username}
RUN echo "${publickey}" >  /sshkeys/${username}/authorized_keys

ADD sshd_config /etc/ssh/sshd_config
ADD sftp_config /etc/ssh/sftp_config

# Start SSHd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
VOLUME [ "/data" ]