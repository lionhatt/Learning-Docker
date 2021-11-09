# FROM busybox
# RUN echo "building simple docker image."
# CMD echo "hello container"

# FROM debian:sid
# RUN apt-get -y update
# RUN apt-get install nano
# CMD ["bin/nano", "/temp/notes"]

FROM ubuntu:16.04 as builder
RUN apt-get update
RUN apt-get -y install curl
RUN curl https://google.com | wc -c > google-size

FROM alpine
COPY --from=builder /google-size /google-size
ENTRYPOINT echo google is this big; cat google-size