FROM python:3.9-slim

COPY  . /mindsciences

ENV RUNTIME_PACKAGES="ssh rsyslog iptables cron curl"
ENV TEMP_PACKAGES=""

RUN apt-get update && apt-get install -y $RUNTIME_PACKAGES $TEMP_PACKAGES --no-install-recommends \
    && apt-get purge -y $TEMP_PACKAGES

RUN > /etc/hosts.deny

RUN pip install -r /mindsciences/statuspage/requirements.txt

EXPOSE 22 5000

ENTRYPOINT ["/mindsciences/docker-entrypoint.sh"]

CMD ["python", "/mindsciences/statuspage/home.py"]
