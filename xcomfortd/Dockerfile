ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install jq
RUN apk add --no-cache jq

# Install xcomfortd
ARG BUILD_VERSION
COPY --from=gbbirkisson/xcomfortd:${BUILD_VERSION} /usr/bin/xcomfortd /usr/bin/xcomfortd

# Add run script
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]