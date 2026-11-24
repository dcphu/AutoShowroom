# Sử dụng Tomcat 10.1 chạy Java 17 chuẩn quốc tế
FROM tomcat:10.1-jdk17-temurin

LABEL maintainer="Phu <contact@autolux.vn>"
LABEL description="AutoLux Motors Showroom Web Application on Render"

# Xóa các ứng dụng mặc định trong Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Đặt file WAR thành ROOT.war để web chạy ngay tại root (/)
COPY dist/AutoShowroom.war /usr/local/tomcat/webapps/ROOT.war

# Render cấp biến môi trường PORT (mặc định 10000 hoặc 8080)
# Tự động thay đổi cổng 8080 trong server.xml thành $PORT khi container khởi động
CMD sed -i "s/port=\"8080\"/port=\"${PORT:-8080}\"/g" /usr/local/tomcat/conf/server.xml && catalina.sh run
