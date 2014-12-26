docker-containers
=================

This is a small collection of Dockerfiles I've been creating mostly for learning and testing purposes.

They can be used to build Docker images, usually by running ```docker build .```from inside the Dockerfile's directory.

Intent is supposed to be clear from the directory name, so Dockerfile inside an nginx directory is expected to build an Nginx server. Some of them include specific instructions.

Please feel free to come back to me with improvements.

aws-ecs-cli
-----------
This will create an image enabled to run the preview version of the AWS CLI that is needed to use EC2 Container Service. It is useful because this way it cannot interfere with your current installation of the CLI.
