FROM alpine:3.6

ENV VERSION v2.16.0-rc.1

MAINTAINER WuZhimin <wuzhimin972@pingan.com.cn>

WORKDIR /

# Enable SSL
RUN apk --update add ca-certificates wget python curl tar jq

# Helm plugins require git
# helm-diff requires bash, curl
RUN apk --update add git bash

# Install Helm
#ENV FILENAME helm-${VERSION}-linux-amd64.tar.gz
#ENV HELM_URL https://get.helm.sh/${FILENAME}


#RUN echo $HELM_URL

#RUN curl -o /tmp/$FILENAME ${HELM_URL} \
#  && tar -zxvf /tmp/${FILENAME} -C /tmp \
#  && mv /tmp/linux-amd64/helm /bin/helm \
#  && rm -rf /tmp


# Install envsubst [better than using 'sed' for yaml substitutions]
#ENV BUILD_DEPS="gettext"  \
#    RUNTIME_DEPS="libintl"

#RUN set -x && \
#    apk add --update $RUNTIME_DEPS && \
#    apk add --virtual build_deps $BUILD_DEPS &&  \
#    cp /usr/bin/envsubst /usr/local/bin/envsubst && \
#    apk del build_deps

# Install Helm plugins
#RUN helm init --client-only
# workaround for an issue in updating the binary of `helm-diff`
#ENV HELM_PLUGIN_DIR /.helm/plugins/helm-diff
# Plugin is downloaded to /tmp, which must exist
#RUN mkdir /tmp
#RUN helm plugin install https://github.com/chartmuseum/helm-push
