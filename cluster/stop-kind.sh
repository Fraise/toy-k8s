#!/bin/bash

kind delete cluster
docker rm -f kind-registry
