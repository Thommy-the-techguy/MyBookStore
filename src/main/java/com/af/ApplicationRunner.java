package com.af;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication(scanBasePackages = {"com.af"})
public class ApplicationRunner {
    public static void main(String[] args) {
        new SpringApplication(ApplicationRunner.class).run(args);
    }
}