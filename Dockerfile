FROM alpine 

VOLUME ["/git", "/export"]

RUN apk add --no-cache git openssh-client

COPY update_repo /etc/periodic/15min/
RUN chmod +x /etc/periodic/15min/update_repo

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["crond", "-f"]
