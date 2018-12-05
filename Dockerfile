# Docker file for Majortomo ZeroMQ MDP Broker

FROM python:3.7

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y libzmq3-dev && apt-get clean -y

RUN useradd -m majortomo

COPY majortomo /usr/local/majortomo/majortomo

RUN cd /usr/local/shoppimon/shoppimon_instellator && pip install -r requirements.txt && pip install -e .

USER majortomo

ENTRYPOINT ["python", "-m", "majortomo.broker"]
