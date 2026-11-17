# Dockerfile cho AutoLux Showroom (Tomcat 10.1 / Jakarta EE 10 / Java 17)
FROM tomcat:10.1-jdk17-temurin

LABEL maintainer="Phu <contact@autolux.vn>"
LABEL description="AutoLux Motors Showroom Web Application"

# Cấu hình cổng 7860 (chuẩn Hugging Face Spaces) và xóa ứng dụng mặc định
RUN sed -i 's/port="8080"/port="7860"/g' /usr/local/tomcat/conf/server.xml && \
    rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR ứng dụng và đặt làm ROOT (phục vụ trực tiếp tại / không cần gõ /AutoShowroom)
COPY dist/AutoShowroom.war /usr/local/tomcat/webapps/ROOT.war

# Cấp toàn quyền cho thư mục Tomcat (Hugging Face chạy với user 1000)
RUN chmod -R 777 /usr/local/tomcat

EXPOSE 7860

CMD ["catalina.sh", "run"]
