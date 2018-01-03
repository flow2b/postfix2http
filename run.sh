#!/bin/bash

MAIL_HOSTNAME="example.com"
SERVER="CONFIG_HTTP_SERVER=https:\\/\\/172.17.0.1\\/"
DOMAINS="CONFIG_RELAY_DOMAINS=myrelaydomain.com,myrelaydomain2.com"
NAME="postfix2http"
DETACH=1

docker stop ${NAME}
docker rm ${NAME}
docker run --name ${NAME} --hostname "${MAIL_HOSTNAME}" --detach=${DETACH} -e ${SERVER} -e ${DOMAINS} -p25:25 flow2b/postfix2http /usr/lib/postfix/sbin/master -d

#run empty shell in new container
#docker run --name ${NAME} --hostname "${MAIL_HOSTNAME}" --detach=0 -e ${SERVER} -e ${DOMAINS} -p25:25 -ti postfix-to-http /bin/bash

#run shell into running container
#docker exec -it $(docker ps -f "name=postfix-to-http" --format "{{.ID}}") /bin/bash

#Check postfix queue
#docker exec -it $(docker ps -f "name=postfix-to-http" --format "{{.ID}}") mailq

