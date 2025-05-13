#!/bin/bash
podman run -d -p 9443:9443 -p 9080:9080 --name eds localhost/eds:1.0