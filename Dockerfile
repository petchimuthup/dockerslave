FROM ubuntu
RUN apt update -y
RUN mkdir -p /var/run/sshd
RUN apt install openjdk-17-jre -y
RUN apt install openssh-server -y
RUN ssh-keygen -A
ADD ./sshd_config /etc/ssh/sshd_config
RUN echo root:password123 | chpasswd -
CMD ["/usr/sbin/sshd","-D"]
