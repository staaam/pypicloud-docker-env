FROM stevearc/pypicloud:1.0.6-py3-alpine

USER root
RUN apk add --no-cache bash
RUN chown pypicloud /etc/pypicloud/config.ini

ADD scripts/* /
ADD config/* /etc/pypicloud/

USER pypicloud
ENTRYPOINT ["/entrypoint.sh"]
CMD ["uwsgi", "--die-on-term", "/etc/pypicloud/config.ini"]
