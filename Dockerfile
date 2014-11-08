FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y mysql-server

ADD my.cnf /etc/mysql/my.cnf
ADD run.sh /

RUN chmod +x /run.sh
CMD /run.sh
