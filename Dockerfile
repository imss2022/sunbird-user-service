FROM openjdk:8-jre-alpine
RUN mkdir -p /home/sunbird/
RUN pwd
ADD /workspace/source/user-org-service/target/user-org-service-1.0.0.jar /home/sunbird/
USER sunbird
RUN chown -R sunbird:sunbird /home/sunbird
CMD java -jar '/home/sunbird/*' play.core.server.ProdServerStart 
