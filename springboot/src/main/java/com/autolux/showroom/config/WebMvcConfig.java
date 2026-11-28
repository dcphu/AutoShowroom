package com.autolux.showroom.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Expose static assets cleanly
        registry.addResourceHandler("/assets/**")
                .addResourceLocations("classpath:/static/assets/", "classpath:/static/");
        registry.addResourceHandler("/css/**")
                .addResourceLocations("classpath:/static/css/", "classpath:/static/assets/css/");
        registry.addResourceHandler("/images/**")
                .addResourceLocations("classpath:/static/images/", "classpath:/static/assets/images/");
        registry.addResourceHandler("/js/**")
                .addResourceLocations("classpath:/static/js/", "classpath:/static/assets/js/");
        registry.addResourceHandler("/vendor/**")
                .addResourceLocations("classpath:/static/vendor/", "classpath:/static/assets/vendor/");
    }
}
