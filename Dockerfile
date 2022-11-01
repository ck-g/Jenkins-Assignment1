FROM centos:8
USER root
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd -y
EXPOSE 80
COPY index.html /var/www/html
RUN chmod 777 /var/www/html/index.html
ENTRYPOINT [ "/usr/sbin/httpd", "-DFOREGROUND" ]
