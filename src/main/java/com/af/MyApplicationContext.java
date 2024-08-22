//package com.af;
//
//import com.af.entity.*;
//import org.hibernate.SessionFactory;
//import org.hibernate.cfg.AvailableSettings;
//import org.hibernate.cfg.Configuration;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.PropertySource;
//import org.springframework.context.annotation.PropertySources;
//import org.springframework.stereotype.Component;
//
//import java.net.MalformedURLException;
//import java.net.URI;
//import java.net.URISyntaxException;
//
//@Component
//@PropertySources({
//        @PropertySource("file:/Users/artem/IdeaProjects/BookStore/src/main/resources/application.yml")
//})
//public class MyApplicationContext {
//
//    @Bean
//    public SessionFactory sessionFactory(@Value("${spring.datasource.url}") String url,
//                                         @Value("${spring.datasource.username}") String username,
//                                         @Value("${spring.datasource.password}") String password) throws URISyntaxException, MalformedURLException {
//        return new Configuration()
//                .addAnnotatedClass(User.class)
//                .addAnnotatedClass(Book.class)
//                .addAnnotatedClass(Category.class)
//                .addAnnotatedClass(BookCategory.class)
//                .addAnnotatedClass(Author.class)
//                .setProperty(AvailableSettings.JAKARTA_JDBC_URL, url)
//                .setProperty(AvailableSettings.JAKARTA_JDBC_USER, username)
//                .setProperty(AvailableSettings.JAKARTA_JDBC_PASSWORD, password)
//                .buildSessionFactory();
//    }
//}
