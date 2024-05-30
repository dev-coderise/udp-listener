FROM alpine:latest

RUN apk update && \
    apk add --no-cache \
    python3 \
    py3-pip \
    python3-dev \
    build-base \
  && rm /usr/lib/python*/EXTERNALLY-MANAGED \
  && python3 -m ensurepip \
  && pip3 install --upgrade pip \
  && pip3 install virtualenv \
  && rm -rf /var/cache/apk/*

ENV UDPPORT 5005
COPY udplistener.py /udplistener.py
CMD ["python3", "-u", "/udplistener.py"]

EXPOSE ${UDPPORT}
EXPOSE ${UDPPORT}/udp
