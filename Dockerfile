FROM nginx:latest

COPY nginx.conf /etc/nginx/conf.d/default.conf

WORKDIR /var/www/html
COPY index.html /var/www/html

# VOLUME [ "/var/www/html" ]
# EXPOSE 443/tcp 80/tcp 8080/tcp 8000/tcp
