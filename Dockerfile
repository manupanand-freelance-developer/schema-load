FROM          docker.io/redhat/ubi9
COPY          mongo.repo /etc/yum.repos.d/mongo.repo
RUN           dnf install mysql mongodb-mongosh git -y
COPY          run.sh /
ENTRYPOINT    ["bash", "-x", "/run.sh"]
RUN           dnf remove python3-setuptools-53.0.0-12.el9_4.1.noarch -y