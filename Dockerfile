
#ddev-generated - Do not modify this file; your modifications will be overwritten.

### DDEV-injected base Dockerfile contents
ARG BASE_IMAGE=php:8.3-fpm
FROM $BASE_IMAGE
SHELL ["/bin/bash", "-c"]

ARG TARGETPLATFORM
ARG TARGETARCH
ARG TARGETOS
ARG username
ARG uid
ARG gid
ARG DDEV_PHP_VERSION
ARG DDEV_DATABASE
RUN (groupadd --gid $gid "$username" || groupadd "$username" || true) && (useradd  -l -m -s "/bin/bash" --gid "$username" --comment '' --uid $uid "$username" || useradd  -l -m -s "/bin/bash" --gid "$username" --comment '' "$username" || useradd  -l -m -s "/bin/bash" --gid "$gid" --comment '' "$username" || useradd -l -m -s "/bin/bash" --comment '' $username )


### From user Dockerfile C:\Users\DELL\mystore\.ddev\db-build\Dockerfile.example:

#ddev-generated
# You can copy this Dockerfile.example to Dockerfile to add configuration
# or packages or anything else to your dbimage
RUN echo "Built on $(date)" > /build-date.txt
