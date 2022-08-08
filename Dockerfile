FROM openjdk:8-jre-alpine
RUN apk update \
    && apk add  unzip \
    && apk add curl \
    && mkdir -p /home/sunbird/
RUN chown -R sunbird:sunbird /home/sunbird
USER sunbird
COPY /workspace/source/user-org-service/target/user-org-service-1.0.0.jar /home/sunbird/
WORKDIR /home/sunbird/
CMD java -jar '/home/sunbird/*' play.core.server.ProdServerStart 
