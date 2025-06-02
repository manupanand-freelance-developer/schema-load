FROM docker.io/redhat/ubi9-minimal:latest

# Add MongoDB repo
COPY mongo.repo /etc/yum.repos.d/mongo.repo

# Install MySQL client, mongosh, git, bash
RUN microdnf install -y mysql mongodb-mongosh git bash

# Copy entrypoint script
COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["bash","./run.sh"]
