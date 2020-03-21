ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

RUN apk add --no-cache libusb-dev mosquitto-dev build-base gcc git jq

RUN git clone https://github.com/gbbirkisson/xcomfortd && cd xcomfortd && make

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]