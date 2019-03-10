FROM ubuntu:18.04

MAINTAINER Matthew Medway

ARG password
ARG username
ARG publickey 

RUN echo "Credentials: ${password} ${username}"
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" \
 -o Dpkg::Options::="--force-confold" install mysecureshell whois procps openssh-server
RUN apt-get clean
RUN mkdir /var/run/sshd
RUN mkdir /data
RUN echo 'root:root' | chpasswd
RUN chmod 4755 /usr/bin/mysecureshell

ADD sshd_config /etc/ssh/sshd_config
ADD sftp_config /etc/ssh/sftp_config
ADD runscript.sh /etc/ssh/runscript.sh

RUN chmod +x /etc/ssh/runscript.sh

# Start SSHd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
VOLUME [ "/data" ]

#ENTRYPOINT ["/etc/ssh/runscript.sh", "${password}","${username}","${publickey}"]