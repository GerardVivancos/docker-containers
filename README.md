docker-containers
=================

This is a small collection of Dockerfiles I've been creating mostly for learning and testing purposes.

They can be used to build Docker images, usually by running `docker build .`from inside the Dockerfile's directory.

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
Builds an image for local dynamodb development. By default, it uses data persistence to a volume mounted on /opt/dynamodb/data. You can override that behaviour and make it use the RAM with no persistence when creating your container: `docker run -d -P --name your-meaninful-name your-image-tag "-inMemory"`

caching-dns-server/bind-server
------------------------------
Builds an image to create containers running the BIND DNS server. Containers should be run with something like `docker run -d -p 53:53/tcp -p 53:53/udp your-image-tag`
