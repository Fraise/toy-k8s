#!/bin/sh

k3d registry create registry.localhost --port 5000
k3d cluster create supercluster --registry-use k3d-registry.localhost:5000 -p "80:80@loadbalancer"
