FROM          docker.io/redhat/ubi9-minimal:latest
COPY          mongo.repo /etc/yum.repos.d/mongo.repo
RUN           dnf install mongodb-mongosh git -y
RUN           mkdir /app
WORKDIR       /app
RUN           git clone https://github.com/roboshop-devops-project-v3/catalogue /app
COPY          run.sh /
ENTRYPOINT    ["bash", "-x", "/run.sh"]
RUN           dnf remove python3-setuptools-53.0.0-12.el9_4.1.noarch -y