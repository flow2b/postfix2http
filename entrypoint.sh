#!/bin/bash

sed -i 's/CONFIG_HTTP_SERVER/'"$CONFIG_HTTP_SERVER"'/g' /etc/postfix/master.cf && \
postconf -e relay_domains="$CONFIG_RELAY_DOMAINS"


exec "$@"
