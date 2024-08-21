package com.af;

import com.af.entity.Author;
import com.af.entity.Book;
import com.af.entity.BookCategory;
import com.af.entity.Category;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AvailableSettings;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.*;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;


@Configuration
@PropertySources({
        @PropertySource("file:///Users/artem/IdeaProjects/BookStore/src/main/resources/application.txt"),
        @PropertySource("file:///Users/artem/IdeaProjects/BookStore/src/main/resources/application2.txt")
})
@ComponentScan(basePackages = {"com.af.*"})
@EnableWebSecurity
public class ApplicationContextConfig {
    static {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    @Bean("sessionFactory")
    @Scope("singleton")
    public SessionFactory getSessionFactory(@Value("${datasource.url}") String url,
                                            @Value("${datasource.username}") String username,
                                            @Value("${datasource.password}") String password) {
        return new org.hibernate.cfg.Configuration()
                .addAnnotatedClass(Book.class)
                .addAnnotatedClass(Author.class)
                .addAnnotatedClass(Category.class)
                .addAnnotatedClass(BookCategory.class)
                .setProperty(AvailableSettings.JAKARTA_JDBC_URL, url)
                .setProperty(AvailableSettings.JAKARTA_JDBC_USER, username)
                .setProperty(AvailableSettings.JAKARTA_JDBC_PASSWORD, password)
                .buildSessionFactory();
    }
}
