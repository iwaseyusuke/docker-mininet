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

## TIPS

### Open X Window applications in containers

If you could not open `xterm` or other X Window applications, or faced to the
following error message;

```bash
root@26f36691a400:~# xterm
No protocol specified
Warning: This program is an suid-root program or is being run by the root user.
The full text of the error or warning message cannot be safely formatted
in this environment. You may get a more descriptive message by running the
program as a non-root user or by removing the suid bit on the executable.
xterm: Xt error: Can't open display: %s
```

Please add `root` user to the local access control list of xhost on your
"Docker host" (not on your containers).

```bash
$ xhost +si:localuser:root
localuser:root being added to access control list
```
