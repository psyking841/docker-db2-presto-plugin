FROM maven:3.6-jdk-8-slim

ARG BUILD_BRANCH=master

WORKDIR /

RUN set -ex \
    && apt-get update -yqq \
    && apt-get install -y git \
    && git clone -b $BUILD_BRANCH https://github.com/psyking841/presto-db2.git \
    && cd /presto-db2 \
    && mvn clean install -DskipTests -Dair.check.skip-all=true