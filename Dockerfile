FROM golang:alpine AS builder
RUN apk add --update git 
RUN go get -u -v github.com/a8m/envsubst/cmd/envsubst

FROM prom/prometheus
COPY --from=builder /go/bin/envsubst /usr/local/bin/envsubst

ADD ./entrypoint.sh /usr/local/bin/entrypoint

ENTRYPOINT [ "entrypoint" ]

