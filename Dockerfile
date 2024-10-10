# ddev-generated - Do not modify this file; your modifications will be overwritten.

### DDEV-injected base Dockerfile contents
ARG BASE_IMAGE=php:8.3-fpm
FROM $BASE_IMAGE
SHELL ["/bin/bash", "-c"]

ARG TARGETPLATFORM
ARG TARGETARCH
ARG TARGETOS
ARG username=defaultuser  # Thêm giá trị mặc định cho username
ARG uid=1000              # Thêm giá trị mặc định cho uid
ARG gid=1000              # Thêm giá trị mặc định cho gid
ARG DDEV_PHP_VERSION
ARG DDEV_DATABASE

RUN (groupadd --gid $gid "$username" || groupadd "$username" || true) && \
    (useradd -l -m -s "/bin/bash" --gid "$gid" --comment '' --uid $uid "$username" || \
     useradd -l -m -s "/bin/bash" --gid "$gid" --comment '' "$username" || \
     useradd -l -m -s "/bin/bash" --gid "$gid" --comment '' "$username")

# Cài đặt Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Tạo cấu hình Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Mở cổng 80
EXPOSE 5432

# Chạy cả Nginx và PHP-FPM
CMD service nginx start && php-fpm
