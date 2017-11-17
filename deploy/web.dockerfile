FROM nginx:1.13

ADD ./deploy/vhost.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www