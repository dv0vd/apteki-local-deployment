ARG work_dir=/app
FROM golang:1.18-alpine as build
RUN apk update && apk add ca-certificates && apk add tzdata
ARG work_dir
ENV GOOS=linux \
    GOARCH=amd64\
	CGO_ENABLED=0
WORKDIR ${work_dir}
