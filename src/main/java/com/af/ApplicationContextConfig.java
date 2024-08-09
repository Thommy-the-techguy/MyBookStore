package com.af;

import com.af.entity.Author;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AvailableSettings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.*;

import java.awt.print.Book;

@Configuration
@PropertySources({
        @PropertySource("file:///Users/artem/IdeaProjects/BookStore/src/main/resources/application.txt"),
        @PropertySource("file:///Users/artem/IdeaProjects/BookStore/src/main/resources/application2.txt")
})
@ComponentScan
public class ApplicationContextConfig {
    static {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

//    @Bean("connection")
//    public Connection getConnection(@Value("${datasource.url}") String url,
//                                    @Value("${datasource.username}") String username,
//                                    @Value("${datasource.password}") String password) {
//        Connection connection = null;
//
//        try {
//            connection = DriverManager.getConnection(url, username, password);
//        } catch (SQLException ex) {
//            System.out.println(ex.getMessage());
//        }
//
//        return connection;
//    }

    @Bean("sessionFactory")
    public SessionFactory getSessionFactory(@Value("${datasource.url}") String url,
                                            @Value("${datasource.username}") String username,
                                            @Value("${datasource.password}") String password) {
        return new org.hibernate.cfg.Configuration()
                .addAnnotatedClass(Book.class)
                .addAnnotatedClass(Author.class)
                .setProperty(AvailableSettings.JAKARTA_JDBC_URL, url)
                .setProperty(AvailableSettings.JAKARTA_JDBC_USER, username)
                .setProperty(AvailableSettings.JAKARTA_JDBC_PASSWORD, password)
                .buildSessionFactory();
    }

    @Bean
    public Session getSession(@Autowired SessionFactory sessionFactory) throws HibernateException {
        return sessionFactory.openSession();
    }
}
