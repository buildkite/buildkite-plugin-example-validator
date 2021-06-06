FROM node:12-alpine@sha256:9a372efac4c436dfb6dbdea42f08d3ea60a0103a1df54a7da247e4bed1b327f7 as base
WORKDIR    /src
ENV        PATH=$PATH:/src/bin PLUGIN_PATH=/plugin
ADD        . /src/
RUN        npm ci
ENTRYPOINT ["lint"]

FROM base as dev
RUN npm -s install
ENTRYPOINT []

FROM base