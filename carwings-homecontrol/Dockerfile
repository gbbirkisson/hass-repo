ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install xcomfortd
COPY --from=gbbirkisson/carwings-homecontrol:0.1 /usr/bin/carwings-homecontrol /usr/bin/carwings-homecontrol

# Add run script
COPY run.sh /run.sh

CMD [ "/run.sh" ]