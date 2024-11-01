FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y nginx openssl

EXPOSE 443

COPY ./nginx.conf ./etc/nginx/conf.d/.

WORKDIR /etc/nginx/ssl

RUN openssl req -x509 -nodes \
    -newkey rsa:4096 \
    -keyout dimarque.key \
    -out dimarque.crt -sha256 -days 365 \
    -subj "/CD=PT"

CMD [ "nginx", "-g", "daemon off;"]