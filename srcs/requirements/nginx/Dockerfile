FROM debian:bullseye

EXPOSE 443

RUN apt update -y && apt upgrade -y && apt install -y nginx openssl

WORKDIR /etc/nginx/ssl/

RUN openssl req -x509 -nodes \
    -newkey rsa:4096 \
    -keyout dimarque.key \
    -out dimarque.crt -sha256 -days 365 \
    -subj "/CD=PT"

COPY nginx.conf etc/nginx/conf.d

CMD [ "nginx", "-g", "daemon off;"]