#
# Ghost Dockerfile
#
# https://github.com/dockerfile/ghost
#

# Pull base image.
FROM dockerfile/nodejs

# Install Ghost
RUN mkdir -p /ghost
RUN cd /ghost && wget https://ghost.org/zip/ghost-0.4.2.zip -O ghost.zip
RUN cd /ghost && unzip ghost.zip && rm -f ghost.zip
RUN cd /ghost && npm install --production
RUN rm -rf /ghost/content/themes/casper

# Mount volumes.
VOLUME /ghost-override

# Define working directory.
WORKDIR /ghost

# Add files.
ADD start.bash /ghost-start

# Expose ports.
EXPOSE 2368

# Define an entry point.
ENV NODE_ENV production
CMD ["bash", "/ghost-start"]
