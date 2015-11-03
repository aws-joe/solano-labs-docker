FROM centos:6

MAINTAINER "fontesj" <fontesj@amazon.com>

RUN yum -y install httpd php php-cli mod_security
RUN /sbin/chkconfig httpd on

EXPOSE 80

# Start the service
CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]
