# BASE
ARG NODE_VERSION=16
FROM node:${NODE_VERSION}-alpine AS base-alpine
EXPOSE 3000

FROM base-alpine

RUN mkdir -p /srv/app && chown 1000:1000 -R /srv/app

WORKDIR /srv/app
VOLUME /srv/app

COPY assets ./assets
COPY components ./components
COPY lib ./lib
COPY pages ./pages
COPY public ./public
COPY next.config.js ./
COPY package.json ./
COPY yarn.lock ./
COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod 777 /usr/local/bin/docker-entrypoint.sh

#ENTRYPOINT ["tail"]
#CMD ["-f","/dev/null"]

CMD ["docker-entrypoint.sh"]
#CMD ["strapi"]