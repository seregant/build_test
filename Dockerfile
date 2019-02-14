FROM golang:rc-alpine3.8
RUN apk add --no-cache git
COPY ./tv-show-api $GOPATH/src/
RUN cd $GOPATH/src/
RUN go get github.com/kardianos/govendor
RUN govendor sync
WORKDIR $GOPATH/src/tv-show-api
CMD ["go","run","main.go"]
EXPOSE 2323