FROM sapmachine:latest

LABEL name=ie.psmware
LABEL vendor="psmware ltd"
LABEL ie.psmware.adci="1.0"
LABEL ie.psmware.adci.release-date="2020-10-10"
LABEL ie.psmware.adci.version.is-production=""

EXPOSE 10389

RUN apt update && \
    apt install -y curl
RUN mkdir /ldap
WORKDIR /ldap
RUN curl -sSL https://github.com/intoolswetrust/ldap-server/releases/download/v.1.0.0/ldap-server.jar -o ldap-server.jar

COPY users.ldif /ldap/users.ldif

CMD ["java","-jar","ldap-server.jar", "users.ldif"]

