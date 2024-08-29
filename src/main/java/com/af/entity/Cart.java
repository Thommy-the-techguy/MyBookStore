package com.af.entity;

import jakarta.persistence.*;


@Entity
public class Cart {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cart_id")
    private long cartId;
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
    @ManyToOne
    @JoinColumn(name = "book_id")
    private Book book;

    public Cart() {}

    public Cart(User user, Book book) {
        this.user = user;
        this.book = book;
    }

    public User getUser() {
        return this.user;
    }

    public Book getBook() {
        return this.book;
    }
}
