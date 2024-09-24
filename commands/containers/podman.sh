#!/bin/bash

podman                                   # Podman CLI command
podman run                               # Run a container
podman ps                                # List running containers
podman stop                              # Stop a running container

# podman – Podman CLI command
podman --version                         # Show the installed Podman version

# podman run – Run a container
podman run hello-world                   # Run a simple "Hello World" container
podman run -d -p 80:80 nginx              # Run NGINX in detached mode and map port 80

# podman ps – List running containers
podman ps                                # List all running containers
podman ps -a                             # List all containers, including stopped ones

# podman stop – Stop a running container
podman stop <container_id>               # Stop a specific running container
podman stop $(podman ps -q)              # Stop all running containers
