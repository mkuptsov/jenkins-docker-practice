FROM centos:7

RUN yum -y install httpd; yum clean all

EXPOSE 80

RUN mkdir -p /var/www/html/prod-site/www
RUN mkdir -p var/www/html/prod-site/logs

COPY www/prod-site.conf /etc/httpd/conf.d/
COPY www/welcome.conf /etc/httpd/conf.d/
COPY www/index.html /var/www/html/prod-site/www/

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
