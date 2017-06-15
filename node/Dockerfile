FROM       ubuntu:latest
MAINTAINER Alex Radyuk "alex.radzyuk@gmail.com"
RUN        \
           apt-get update && apt-get install -y nodejs npm git && \                                           
           rm -rf /var/lib/apt/lists/* && \
           mkdir /basic_node_ci
WORKDIR    /basic_node_ci
ADD .      /basic_node_ci
RUN        npm init --yes && npm install express --save
EXPOSE     3000
CMD        ["nodejs", "app.js"]
