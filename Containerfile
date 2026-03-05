FROM docker.io/library/eclipse-temurin:8-jdk-jammy

ARG TIMEZONE=${TIMEZONE}
ARG PAYARA_DIR=${PAYARA_DIR}

RUN apt-get update && \
    apt-get install -y unzip && \
    rm -rf /var/lib/apt/lists/*

    