FROM golang:alpine3.11 as builder

RUN apk add --no-cache --update git gcc libc-dev

RUN go get -u github.com/joeshaw/carwings-homecontrol

FROM alpine:3.11

COPY --from=builder /go/bin/carwings-homecontrol /usr/bin/carwings-homecontrol

CMD ["carwings-homecontrol"]