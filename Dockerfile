FROM icr.io/appcafe/websphere-liberty:kernel-java8-openj9-ubi

# Default setting for the verbose option. Set it to true to debug the application container image build failures
ARG VERBOSE=true
WORKDIR /config

# Add Liberty server configuration including all necessary features
COPY --chown=1001:0  server.xml /config/
#COPY --chown=1001:0  EDS-liberty.xml /config/configDropins/defaults/

# Modify feature repository (optional)
#COPY --chown=1001:0 featureUtility.properties /opt/ibm/wlp/etc/

# This script will add the requested XML snippets to enable Liberty features and grow the image to be fit-for-purpose using featureUtility.
RUN features.sh

# Add interim fixes (optional)
#COPY --chown=1001:0  interim-fixes /opt/ibm/fixes/

# Add application
COPY --chown=1001:0  apps /config/apps
#COPY --chown=1001:0  apps /config/dropins/

# This script will add the requested server configurations, apply any interim fixes and populate caches to optimize runtime
RUN configure.sh
