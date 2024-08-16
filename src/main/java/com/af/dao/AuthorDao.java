package com.af.dao;

import com.af.entity.Author;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class AuthorDao {
    private final SessionFactory sessionFactory;

    private AuthorDao(@Autowired SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List<Author> getAuthors() {
        List<Author> authors = new ArrayList<>();

        try (Session session = sessionFactory.openSession()) {
            authors = session.createSelectionQuery("from Author order by authorId").list()
                    .stream().map(capture -> (Author) capture).toList();
        }

        return authors;
    }

    public Author getAuthorById(int id) {
        Author author = null;

        try (Session session = sessionFactory.openSession()) {
            author = session.get(Author.class, id);
        }

        return author;
    }

    public void saveAuthor(Author author) {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            session.persist(author);
            session.getTransaction().commit();
        }
    }

    public void deleteAuthor(Author author) {
        try (Session session = sessionFactory.openSession()) {
            session.beginTransaction();
            session.remove(author);
            session.getTransaction().commit();
        }
    }
}
