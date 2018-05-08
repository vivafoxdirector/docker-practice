FROM centos
MAINTAINER foxdirector <yongsujeon@gmail.com>
CMD echo "now running..."

#RUN yum install -y httpd
RUN ["yum", "-y", "install", "httpd"]
#ADD ./index.html /var/www/html/
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
