package com.af;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ApplicationRunner {
    public static void main(String[] args) {
        new SpringApplication(ApplicationRunner.class).run(args);
    }
}