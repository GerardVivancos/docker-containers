docker-containers
=================

This is a small collection of Dockerfiles I've been creating mostly for learning and testing purposes.

They can be used to build Docker images, usually by running `docker build .`from inside the Dockerfile's directory. You can also find almost all the images on my Docker Hub repository: https://hub.docker.com/u/gerardvivancos/

Intent is supposed to be clear from the directory name, so Dockerfile inside an nginx directory is expected to build an Nginx server. Some of them include specific instructions.

Please feel free to come back to me with improvements.

aws-ecs-cli
-----------
This will create an image enabled to run the preview version of the AWS CLI that is needed to use EC2 Container Service. It is useful because this way it cannot interfere with your current installation of the CLI.

aws-cli
-------
This will create an image enabled to run the latest AWS CLI. It is useful because each container can use it's own AK/SK set, so with multiple containers you can manage multiple accounts with no conflicts. It also prevents you from potential Python version conflicts with your host system's installation.

ruby/ruby-2.2.0
---------------
It builds an image with Ruby 2.2.0 installed, compliled from source. It also installs Bundler.

shared-storage
--------------
It builds a minimal (~2MB) image based on busybox that creates a volume in /data. It's purpose is to serve as a shared volume across related containers.

dynamodb
--------
Builds an image for local dynamodb development. By default, it uses data persistence to a volume mounted on /opt/dynamodb/data. You can override that behaviour and make it use the RAM with no persistence when creating your container: `docker run -d -P --name your-meaningful-name your-image-tag "-inMemory"`

vi
--
Builds an image (~2MB) based on Busybox that starts the vi editor. Intended usage is to edit files on shared volumes. When you launch a container based on it, pass the path to the file to be opened. Example: `docker run -ti --rm your-image-tag --volumes-from some-other-container /path/to/file` (the `--rm` flag deletes the container after editing is done)

ls
--
Builds an image (~2MB) based on Busybox that lists a directory (it just launches `ls -l`). Intended usage is to list directories on shared volumes. When you launch a container based on it, pass the path to the directory to be listed. Example: `docker run -ti --rm your-image-tag --volumes-from some-other-container /path/to/directory` (the `--rm` flag deletes the container after editing is done)

caching-dns-server/bind-server
------------------------------
Builds an image to create containers running the BIND DNS server. Containers should be run with something like `docker run -d -p 53:53/tcp -p 53:53/udp --your-meaningful-name your-image-tag`
If you need to change the configuration once the container is running, just use the vi container (`gerardvivancos/vi`) or similar and attach it to the volume of the DNS server container: `docker run -ti --rm --volumes-from dns-server-container-name gerardvivancos/vi /var/named/named.conf`. You can aalso add new files, such as zone files, in the same way. When you're done editing, just restart the DNS container: `docker restart dns-server-container-name`.
Keep in mind that the default `allow-query` options won't let you query the DNS server from outside the Docker host. This is because the options `localhost` and `localnets` refer to the virtual network range of the container and queries made from the local network of the host are seen as being made from outside the network of the container. You might want to edit named.conf and add your local network CIDR to the allow-query directive (for example: allow-query     { localhost; localnets; 192.168.0.0/16; };`

