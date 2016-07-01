FROM centos:latest

MAINTAINER James Eckersall <james.eckersall@gmail.com>

ADD deps.sh /

RUN \
  yum install -y epel-release && \
  yum install -y iproute net-tools ngrep tcpdump nmap ss traceroute which tar
RUN \
  mkdir -p /tmp/deps && \
  /deps.sh `which ping` /tmp/deps/ && \
  /deps.sh `which tracepath` /tmp/deps && \
  /deps.sh `which traceroute` /tmp/deps && \
  /deps.sh `which traceroute6` /tmp/deps && \
  /deps.sh `which tcpdump` /tmp/deps && \
  /deps.sh `which ngrep` /tmp/deps && \
  /deps.sh `which arping` /tmp/deps && \
  /deps.sh `which netstat` /tmp/deps && \
  /deps.sh `which ss` /tmp/deps && \
  /deps.sh `which ifstat` /tmp/deps && \
  /deps.sh `which ip` /tmp/deps && \
  /deps.sh `which nmap` /tmp/deps && \
  /deps.sh `which tar` /tmp/deps && \
  cp /usr/lib64/libnss* /tmp/deps/lib64/ && \
  mkdir /tmp/deps/etc && \
  echo "tcpdump:x:72:72::/:/sbin/nologin" > /tmp/deps/etc/passwd && \
  echo "nobody:x:99:99:Nobody:/:/sbin/nologin" >> /tmp/deps/etc/passwd && \
  echo "tcpdump:x:72:" > /tmp/deps/etc/group && \
  echo "nobody:x:99:" >> /tmp/deps/etc/group
