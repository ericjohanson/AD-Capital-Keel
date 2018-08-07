#!/bin/bash

# 1st param to LoadRunner call
if [ -z "${PORTAL_HOST}" ]; then
        export PORTAL_HOST="portal";
fi

# 2nd param to LoadRunner call
if [ -z "${PROCESSOR_HOST}" ]; then
        export PROCESSOR_HOST="processor";
fi

# Service dependencies
dockerize -wait tcp://${PORTAL_HOST}:8080 \
          -wait tcp://${PROCESSOR_HOST}:8080 \
          -wait-retry-interval ${RETRY} -timeout ${TIMEOUT} || exit $?

# TODO: AD-Capital-Load has ports hard-coded to 8080
${LOAD_GEN_PROJECT}/bin/AD-Capital-Load ${PORTAL_HOST} ${PROCESSOR_HOST}
