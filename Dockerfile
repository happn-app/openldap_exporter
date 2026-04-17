FROM alpine:3.18
LABEL maintainer="happn <ops@happn.com>"
ARG URL

RUN apk add --no-cache curl gzip

WORKDIR /app
RUN curl -sSLO ${URL}
RUN gunzip openldap_exporter-linux-amd64.gz
RUN mv openldap_exporter-linux-amd64 openldap_exporter

ENTRYPOINT ["/app/openldap_exporter"]
