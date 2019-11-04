FROM alpine:3.6

MAINTAINER WuZhimin <wuzhimin972@pingan.com.cn>

WORKDIR /

# Enable SSL
RUN apk --update add ca-certificates wget python curl tar jq

RUN apk --update add git bash
