FROM ubuntu:xenial

LABEL maintainer="Artem Bokhan <art@eml.ru>"

EXPOSE 25/tcp

RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get -qq update && \
    echo "postfix postfix/main_mailer_type string No configuration" | debconf-set-selections && \
    apt-get install -qq -y postfix python > /dev/null 2>/dev/null && \
    echo "All packages installed successfully"

RUN make-ssl-cert generate-default-snakeoil --force-overwrite 2>/dev/null
RUN useradd exec

COPY ./etc /etc

RUN postfix start && postfix stop

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
