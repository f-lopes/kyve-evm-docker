FROM alpine:3.15 as kyve-evm-binary

LABEL maintainer="Florian Lopes <florian.lopes@outlook.com>"

ARG KYVE_EVM_VERSION="v1.0.3"
ARG KYVE_EVM_RELEASE_BINARY=evm-linux.zip
ARG KYVE_EVM_RELEASE_URL="https://github.com/KYVENetwork/evm/releases/download/${KYVE_EVM_VERSION}/${KYVE_EVM_RELEASE_BINARY}"

ENV KYVE_EVM_VERSION=${KYVE_EVM_VERSION} \
    KYVE_EVM_HOME="/kyve-evm"

RUN mkdir ${KYVE_EVM_HOME} && \
    wget -q ${KYVE_EVM_RELEASE_URL} && \
    unzip ${KYVE_EVM_RELEASE_BINARY} -d ${KYVE_EVM_HOME} && \
    rm -rf ${KYVE_EVM_RELEASE_BINARY}

FROM gcr.io/distroless/nodejs:16 as kyve-evm-node

LABEL maintainer="Florian Lopes <florian.lopes@outlook.com>"

ARG KYVE_EVM_VERSION="v1.0.3"

ENV KYVE_EVM_VERSION=${KYVE_EVM_VERSION} \
    KYVE_EVM_HOME="/kyve-evm" \
    ARWEAVE_HOME="/arweave"

COPY --chown=1000:1000 --from=kyve-evm-binary ${KYVE_EVM_HOME}/evm-linux ${KYVE_EVM_HOME}/evm-linux

USER 1000

VOLUME ${ARWEAVE_HOME}

WORKDIR ${KYVE_EVM_HOME}

ENTRYPOINT ["./evm-linux"]
CMD ["--version"]