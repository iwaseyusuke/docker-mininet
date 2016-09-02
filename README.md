# docker-mininet

The Docker image for [Mininet](http://mininet.org/)

## Docker Pull Command

Download from [Docker Hub](https://hub.docker.com/)

`$ docker pull iwaseyusuke/mininet`

## Docker Run Command

```
$ docker run -it --rm --privileged -e DISPLAY \
             -v /tmp/.X11-unix:/tmp/.X11-unix \
             -v /lib/modules:/lib/modules \
             iwaseyusuke/mininet
```

## Docker Compose

If you have installed [Docker Compose](https://docs.docker.com/compose/),
you can run container with:

```
$ wget https://github.com/iwaseyusuke/docker-mininet/raw/master/docker-compose.yml

$ docker-compose run --rm mininet
```
