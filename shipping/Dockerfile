FROM          docker.io/redhat/ubi9-minimal:latest
RUN           microdnf install mysql bash git -y
RUN           mkdir /app
WORKDIR       /app
RUN           git clone https://github.com/roboshop-devops-project-v3/shipping /app
COPY          run.sh /
ENTRYPOINT    ["bash", "-x", "/run.sh"]
RUN           dnf remove python3-setuptools-53.0.0-12.el9_4.1.noarch -y