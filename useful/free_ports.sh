#!/bin/bash

for port in {8000..8100}; do
  if ! sudo lsof -i:$port > /dev/null; then
    echo "Port $port is free"
  fi
done
