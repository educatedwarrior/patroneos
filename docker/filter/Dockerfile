FROM golang:alpine as builder

ADD . /repo 
RUN cd /repo && go build -o patroneosd *.go 

FROM alpine:3.7

ENV DATADIR /etc/patroneos
ENV CONFIGFILE config.json 
ENV DAEMONFILE /usr/bin/patroneosd 

RUN apk update && apk upgrade && apk add bash bash-doc

RUN mkdir -p /etc/patroneos

COPY --from=builder /repo/patroneosd /usr/bin/patroneosd
COPY docker/filter/config.json.sample /etc/patroneos/
COPY docker/filter/init.sh /etc/patroneos
RUN chmod +x /etc/patroneos/init.sh

WORKDIR /etc/patroneos
#VOLUME "$DATADIR" 

#CMD ["/dev/null"]
CMD ["/etc/patroneos/init.sh"]
#ENTRYPOINT ["/usr/bin/patroneosd"]
