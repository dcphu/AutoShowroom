# Dockerfile cho AutoLux Showroom (Tomcat 10.1 / Jakarta EE 10 / Java 17)
FROM tomcat:10.1-jdk17-temurin

LABEL maintainer="Phu <contact@autolux.vn>"
LABEL description="AutoLux Motors Showroom Web Application"

# Xóa các ứng dụng mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR ứng dụng và đặt làm ROOT (phục vụ trực tiếp tại / không cần gõ /AutoShowroom)
COPY dist/AutoShowroom.war /usr/local/tomcat/webapps/ROOT.war

# Port mặc định của Tomcat
EXPOSE 8080

# Chạy Tomcat
CMD ["catalina.sh", "run"]
