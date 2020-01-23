FROM docker:18.05

COPY ./goss /usr/local/bin/goss
COPY ./dgoss /usr/local/bin/dgoss
RUN apk add --no-cache bash && \
    chmod +rx /usr/local/bin/goss /usr/local/bin/dgoss
