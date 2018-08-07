#FROM openjdk:8-jre-slim AS builder
FROM store/appdynamics/machine:4.3.7.1


# Include start script to configure and start MA at runtime

ENV MACHINE_AGENT_HOME /opt/appdynamics/

ADD start-appdynamics ${MACHINE_AGENT_HOME}
RUN chmod 744 ${MACHINE_AGENT_HOME}/start-appdynamics

# Configure and Run AppDynamics Machine Agent
CMD "${MACHINE_AGENT_HOME}/start-appdynamics"

# Analytics Agent listener
EXPOSE 9090
