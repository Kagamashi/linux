#!/bin/bash

docker                                   # Docker CLI command
docker run                               # Run a container
docker ps                                # List running containers
docker exec                              # Execute a command in a running container
docker stop                              # Stop a running container
docker-compose                           # Manage multi-container Docker applications

# docker – Docker CLI command
docker --version                         # Show the installed Docker version

# docker run – Run a container
docker run hello-world                   # Run a simple "Hello World" container
docker run -d -p 80:80 nginx             # Run NGINX in detached mode and map port 80

# docker ps – List running containers
docker ps                                # List all running containers
docker ps -a                             # List all containers, including stopped ones

# docker exec – Execute a command in a running container
docker exec -it <container_id> bash      # Open a bash shell in a running container
docker exec <container_id> ls            # List files in a running container

# docker stop – Stop a running container
docker stop <container_id>               # Stop a specific running container
docker stop $(docker ps -q)              # Stop all running containers

# docker-compose – Manage multi-container Docker applications
docker-compose up                        # Start services defined in docker-compose.yml
docker-compose down                      # Stop and remove containers defined in docker-compose.yml
