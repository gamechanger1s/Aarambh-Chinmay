FROM centos:latest
RUN  sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN  sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd zip unzip -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page287/eflyer.zip /var/www/html
WORKDIR /var/www/html
RUN unzip eflyer.zip
RUN rm -rf eflyer.zip &&\ 
    cp -rf eflyer/* . &&\
    rm -rf eflyer
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND
