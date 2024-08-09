package com.af.dao;

import com.af.entity.Author;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class AuthorDao {
    private final Session session;

    private AuthorDao(@Autowired Session session) {
        this.session = session;
    }

    public List<Author> getAuthors() {
        List<Author> authors = new ArrayList<>();

        authors = session.createSelectionQuery("from Author order by author_id").list()
                .stream().map(capture -> (Author) capture).toList();

        return authors;
    }

    public Author getAuthorById(int id) {
        return (Author) session.get(Author.class, id);
    }

    public void saveAuthor(Author author) {
        session.beginTransaction();
        session.persist(author);
        session.getTransaction().commit();
    }

    public void deleteAuthor(Author author) {
        session.beginTransaction();
        session.remove(author);
        session.getTransaction().commit();
    }
}
