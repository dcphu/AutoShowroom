package com.autolux.showroom;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;

import java.io.IOException;

@SpringBootApplication
public class AutoShowroomApplication {

    private static final Logger log = LoggerFactory.getLogger(AutoShowroomApplication.class);

    @Value("${server.port:8080}")
    private String port;

    public static void main(String[] args) {
        SpringApplication.run(AutoShowroomApplication.class, args);
    }

    @EventListener(ApplicationReadyEvent.class)
    public void openBrowserOnStartup() {
        String url = "http://localhost:" + port;
        log.info("AutoLux Motors đang tự động mở trình duyệt tại: {}", url);
        try {
            String os = System.getProperty("os.name", "").toLowerCase();
            if (os.contains("win")) {
                new ProcessBuilder("cmd", "/c", "start", url).start();
            } else if (os.contains("mac")) {
                new ProcessBuilder("open", url).start();
            } else if (os.contains("nix") || os.contains("nux")) {
                new ProcessBuilder("xdg-open", url).start();
            }
        } catch (IOException e) {
            log.warn("Không thể tự động mở trình duyệt: {}", e.getMessage());
        }
    }
}
