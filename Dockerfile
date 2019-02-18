FROM golang:rc-alpine3.8
RUN apk add --no-cache git
RUN mkdir $GOPATH/src/tv-show-api
COPY tv-show-api/* $GOPATH/src/tv-show-api/
RUN cd $GOPATH/src/tv-show-api/
RUN ls -al
RUN cd $GOPATH/src && go get github.com/kardianos/govendor
RUN cd $GOPATH/src/tv-show-api &&\
  	govendor sync

WORKDIR $GOPATH/src/tv-show-api
CMD ["go","run","main.go"]
EXPOSE 2323