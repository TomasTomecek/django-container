# Django in a container

This is a project of production deployment of Django using containers.


## Setup

You have to setup a directory with data for postgres:

```
$ mkdir db/
$ chown 26:26 db/
```

Then it's just a single command:

```
$ docker-compose up
```


## Architecture

### Components

 * All images are based on `fedora:24` docker image

 * Django application is running in uwsgi application server

 * The site is served by nginx web server

 * PostgreSQL is the choice for database
