FROM centos:6

MAINTAINER "fontesj" <fontesj@amazon.com>

RUN yum -y install httpd php php-cli mod_security
RUN /sbin/chkconfig httpd on

ADD php-app/index.php /var/www/html/index.php
ADD php-app/www /var/www/html/www

EXPOSE 80

# Start the service
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
#ENTRYPOINT ["/usr/sbin/httpd"]
