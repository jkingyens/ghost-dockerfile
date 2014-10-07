FROM node:0.10.32
RUN mkdir -p /ghost
WORKDIR /ghost
RUN curl -OL https://ghost.org/zip/ghost-0.5.2.zip
RUN apt-get install unzip
RUN unzip ghost-0.5.2.zip
RUN rm ghost-0.5.2.zip
RUN npm install --production
RUN rm -rf content
RUN rm -rf config.js
EXPOSE 2368
ENV NODE_ENV production
CMD npm start
