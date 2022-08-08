FROM openjdk:8-jre-alpine
RUN apk update \
    && apk add  unzip \
    && apk add curl \
    && adduser -u 1001 -h /home/sunbird/ -D sunbird \
    && mkdir -p /home/sunbird/
RUN chown -R sunbird:sunbird /home/sunbird
USER sunbird
COPY /workspace/source/user-org-service/target/user-org-service-1.0.0.jar /home/sunbird/
RUN unzip /home/sunbird/user-org-service-1.0.0.jar -d /home/sunbird/
WORKDIR /home/sunbird/
CMD java  -cp '/home/sunbird/user-org-service-1.0.0/lib/*' play.core.server.ProdServerStart  /home/sunbird/user-org-service-1.0.0
