# docker-mininet

The Docker image for [Mininet](http://mininet.org/)

## Usage

### Get Docker Image

Download from [Docker Hub](https://hub.docker.com/)

```bash
docker pull iwaseyusuke/mininet
```

### Run Docker Container

```bash
docker run -it --rm --privileged -e DISPLAY \
             -v /tmp/.X11-unix:/tmp/.X11-unix \
             -v /lib/modules:/lib/modules \
             iwaseyusuke/mininet
```

Output Example:

```text
 * Inserting openvswitch module
 * /etc/openvswitch/conf.db does not exist
 * Creating empty database /etc/openvswitch/conf.db
 * Starting ovsdb-server
 * Configuring Open vSwitch system IDs
 * Starting ovs-vswitchd
 * Enabling remote OVSDB managers
root@457697d70ebc:~#
```

Now, you can run `mn` command inside the container.

Also, you can pass options for `mn` command when running a new container.

```bash
$ docker run -it --rm --privileged -e DISPLAY \
             -v /tmp/.X11-unix:/tmp/.X11-unix \
             -v /lib/modules:/lib/modules \
             iwaseyusuke/mininet --topo linear
```

Output Example:

```text
 * /etc/openvswitch/conf.db does not exist
 * Creating empty database /etc/openvswitch/conf.db
 * Starting ovsdb-server
 * Configuring Open vSwitch system IDs
 * Starting ovs-vswitchd
 * Enabling remote OVSDB managers
*** Error setting resource limits. Mininet's performance may be affected.
*** Creating network
*** Adding controller
*** Adding hosts:
h1 h2
*** Adding switches:
s1 s2
*** Adding links:
(h1, s1) (h2, s2) (s2, s1)
*** Configuring hosts
h1 h2
*** Starting controller
c0
*** Starting 2 switches
s1 s2 ...
*** Starting CLI:
mininet>
```

## Docker Compose

If you have installed [Docker Compose](https://docs.docker.com/compose/),
you can run container with:

```bash
# Download Compose file
wget https://raw.githubusercontent.com/iwaseyusuke/docker-mininet/main/docker-compose.yml

# Run a container
docker compose run --rm mininet
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
