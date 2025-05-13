#!/bin/bash
export VERSION=1.0

podman stop eds
podman container rm -f eds
podman image rm -f eds:${VERSION}

podman build -t eds:${VERSION} .