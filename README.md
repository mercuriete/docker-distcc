# docker-distcc  
distcc image
The purpouse of this image is to create a swarm stack of distcc services.
This has been archieved with the following parameteres in the main docker-compose.yml.
```yml
version: '3.3'  
services:  
  distcc:  
    image: mercuriete/distcc  
    environment:  
      - NETWORK=192.168.1.0/24  
    #bypass routing mesh to avoid load balancing  
    ports:  
      - target: 3632  
        published: 3632  
        protocol: tcp  
        mode: host  
    #Only one instance per node  
    deploy:  
      mode: global
```
With port mode host we are bypassing the _routing mesh_. See [documentation](https://docs.docker.com/engine/swarm/ingress/#bypass-the-routing-mesh).

With deploy mode global we are forcing one and only one instance per node on our swarm cluster. See [documentation](https://docs.docker.com/engine/swarm/services/#replicated-or-global-services).


## Usage:  

The prerequisites is have at least one node of docker swarm. See [documentation](https://docs.docker.com/engine/swarm/swarm-tutorial/create-swarm/).
  
1. Clone repository and deploy stack
```shell  
git clone https://github.com/mercuriete/docker-distcc.git && \
cd docker-distcc && \
docker stack deploy --compose-file=docker-compose.yml distcc
```
* Remember to change the NETWORK environmental variable in the docker-compose.yml according your networking ip configuration. This is important to allow the server to accept connection from clients. By default is 192.168.1.0/24.
2. From Client Side
You need to configure the clients as usual in a normal distcc configuration. See [documentation from man](http://manpages.ubuntu.com/manpages/cosmic/man1/distcc.1.html#host%20specifications).
You have to go to /etc/distcc/host and enter an entry per node like this:
```
192.168.1.2,cpp,lzo 192.168.1.3,cpp,lzo 192.168.1.4,cpp,lzo
```
cpp is for pump and lzo is for compress the transfers.

3. Then you need to change your build system to wrap your calls to gcc.
```bash
pump distcc g++ -c hello_world.cpp
```
or
```bash
pump make -j`distcc -j` CC="distcc gcc"
```
If you want to learn more, read the doc of distcc

Hope you enjoy this repo.

## LICENSE
This repo was forked from https://github.com/choldrim/docker-distcc and this repo doesn't specify any license so I am relicensing to:
[Do what the fuck you want to public license](http://www.wtfpl.net/)

