package com.af.dao;

import com.af.entity.Book;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class BookDao {
    private final SessionFactory sessionFactory;

    public BookDao(@Autowired SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List<Book> getBooks() {
        List<Book> books = new ArrayList<>();

        try (Session session = sessionFactory.openSession()) {
            books = session.createSelectionQuery("from Book", Book.class).list();
        }

        return books;
    }

    public List<Book> getBestsellers() {
        List<Book> bestsellers = new ArrayList<>();

        try (Session session = sessionFactory.openSession()) {
            bestsellers = session.createSelectionQuery(
                    "from Book b join BookCategory bc on b.bookId = bc.book.bookId where bc.category.categoryId = 1",
                    Book.class).list();
        }

        return bestsellers;
    }

    public List<Book> getBooksByCategory(int categoryId) {
        List<Book> books = new ArrayList<>();

        try (Session session = sessionFactory.openSession()) {
            books = session.createSelectionQuery(
                            "from Book b join BookCategory bc on b.bookId = bc.book.bookId where bc.category.categoryId = :categoryId",
                            Book.class)
                    .setParameter("categoryId", categoryId)
                    .list();
        }

        return books;
    }

    public List<Book> getBooksByCategoryAndAuthor(int categoryId, List<Integer> authorIds) {
        List<Book> books = new ArrayList<>();

        try (Session session = sessionFactory.openSession()) {
            books = session.createSelectionQuery(
                            "from Book b join BookCategory bc on b.bookId = bc.book.bookId where bc.category.categoryId = :categoryId and b.author.authorId in :authorIds",
                            Book.class
                    )
                    .setParameter("categoryId", categoryId)
                    .setParameter("authorIds", authorIds)
                    .list();
        }

        return books;
    }

    public List<Book> getBooksByCategoryAndYear(int categoryId, List<Integer> bookYears) {
        List<Book> books = new ArrayList<>();

        try (Session session = sessionFactory.openSession()) {
            books = session.createSelectionQuery(
                            "from Book b " +
                                    "join BookCategory bc on b.bookId = bc.book.bookId " +
                                    "where bc.category.categoryId = :categoryId " +
                                    "and b.year in :bookYears",
                            Book.class
                    )
                    .setParameter("categoryId", categoryId)
                    .setParameter("bookYears", bookYears)
                    .list();
        }

        return books;
    }

    public List<Book> getBooksByCategoryAndAuthorAndBookYear(int categoryId, List<Integer> authorIds, List<Integer> bookYears) {
        List<Book> books = new ArrayList<>();

        try (Session session = sessionFactory.openSession()) {
            books = session.createSelectionQuery(
                            "from Book b " +
                                    "join BookCategory bc on b.bookId = bc.book.bookId " +
                                    "where bc.category.categoryId = :categoryId " +
                                        "and b.author.authorId in :authorIds " +
                                        "and b.year in :bookYears",
                            Book.class
                    )
                    .setParameter("categoryId", categoryId)
                    .setParameter("authorIds", authorIds)
                    .setParameter("bookYears", bookYears)
                    .list();
        }

        return books;
    }
}
