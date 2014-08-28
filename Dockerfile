#
# Ghost Dockerfile
#
# https://github.com/dockerfile/ghost
#

# Pull base image.
FROM dockerfile/nodejs

# Install Ghost
RUN mkdir -p /ghost
RUN cd /ghost && wget https://ghost.org/zip/ghost-0.5.1.zip -O ghost.zip
RUN cd /ghost && unzip ghost.zip && rm -f ghost.zip
RUN cd /ghost && npm install --production
RUN rm -rf /ghost/content
RUN rm -rf /ghost/config.js

# Define working directory.
WORKDIR /ghost

# Expose ports.
EXPOSE 2368

# Define an entry point.
ENV NODE_ENV production
CMD npm start
