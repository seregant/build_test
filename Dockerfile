FROM golang:rc-alpine3.8
RUN apk add --no-cache git
COPY tv-show-api $GOPATH/src/tv-show-api/
RUN go get github.com/kardianos/govendor
WORKDIR $GOPATH/src/tv-show-api
RUN ls -al $GOPATH/src
RUN ls -al $GOPATH/src/tv-show-api
RUN ls -al
RUN govendor sync
CMD ["go","run","main.go"]
EXPOSE 2323