package com.af.entity;

import jakarta.persistence.*;

import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "book_category_mapping")
public class BookCategory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "record_id")
    private long recordId;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "book_id")
    private Book book;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private Category category;

    protected BookCategory() {

    }

    public BookCategory(Book book, Category category) {
        this.book = book;
        this.category = category;
    }

    public Category getCategory() {
        return this.category;
    }

    @Override
    public boolean equals(Object object) {
        if (this == object) return true;
        if (object == null || getClass() != object.getClass()) return false;
        BookCategory that = (BookCategory) object;
        return Objects.equals(book, that.book) && Objects.equals(category, that.category);
    }

    @Override
    public int hashCode() {
        return Objects.hash(book, category);
    }

    @Override
    public String toString() {
        return "BookCategory{" +
                "category=" + category +
                '}';
    }
}
