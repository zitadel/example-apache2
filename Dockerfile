FROM httpd:2.4
COPY ./public-html/ /usr/local/apache2/htdocs/
COPY ./zitadel-httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./auth_openidc-httpd.conf /usr/local/apache2/conf/auth_openidc-httpd.conf

USER root
RUN set -x \
    && apt-get update \
    && apt-get install -y libapache2-mod-auth-openidc