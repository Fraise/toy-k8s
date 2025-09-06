#!/bin/sh

k3d cluster delete supercluster
docker rm -f k3d-registry.localhost
