FROM justscott64/jscarmods-fivem
LABEL maintainer="https://github.com/JustScott64/"

LABEL org.opencontainers.image.source="https://github.com/JustScott64/jscarmods-fivem-docker"

ENV download="recommended"

EXPOSE 40120/tcp
EXPOSE 30120/tcp
EXPOSE 30120/udp
EXPOSE 30110/tcp
EXPOSE 30110/udp

COPY ./startup.sh /opt/fivem/startup.sh

RUN apk add --no-cache libgcc libstdc++ ca-certificates npm tzdata
RUN npm install -g fvm-installer

WORKDIR /opt/fivem

ENTRYPOINT ["sh", "/opt/fivem/startup.sh"]