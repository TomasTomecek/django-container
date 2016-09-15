FROM fedora:24
MAINTAINER Tomas Tomecek "ttomecek@redhat.com"
RUN dnf install -y git python-pip gcc python-devel postgresql-devel redhat-rpm-config python2-pytest nmap-ncat python-psycopg2 python-six && \
    npm install -g bower

ARG USER_ID=1000
RUN useradd -o -u ${USER_ID} reporter && \
    mkdir -p /opt/app && \
    chown reporter:reporter /opt/app
USER reporter

WORKDIR /opt/app

COPY ./requirements.txt /opt/app/
RUN pip install --user -r ./requirements.txt

COPY . /opt/app/
USER root
RUN chown -R reporter:reporter .
USER reporter

CMD ncat -v -w 30 db 5432 && exec python /opt/app/manage.py runserver -v3 0.0.0.0:8000