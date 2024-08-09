package com.af;

import com.af.dao.AuthorDao;
import com.af.entity.Author;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.*;
import java.util.List;

public class ApplicationRunner {
    public static void main(String[] args) {
        ApplicationContext context = new AnnotationConfigApplicationContext(ApplicationContextConfig.class);

        AuthorDao authorRepo = context.getBean(AuthorDao.class);
        List<Author> authors = authorRepo.getAuthors();
        authors.forEach(System.out::println);

        System.out.println(authorRepo.getAuthorById(1));
    }
}