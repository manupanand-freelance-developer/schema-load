FROM docker.io/redhat/ubi9-minimal:latest

# Add MongoDB repo
COPY mongo.repo /etc/yum.repos.d/mongo.repo

# Set working directory
WORKDIR /app

# Install required tools using microdnf
RUN microdnf update -y && \
    microdnf install -y mysql git bash ca-certificates && \
    microdnf clean all

# Install mongosh separately using MongoDB repo (ensure correct repo content)
RUN microdnf install -y mongodb-mongosh && \
    microdnf clean all

# Copy entrypoint script
COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["bash", "/run.sh"]
