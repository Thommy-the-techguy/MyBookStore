package com.af.entity;

import jakarta.persistence.*;

import java.util.Objects;


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

    public void setUser(User user) {
        this.user = user;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Cart cart = (Cart) o;
        return cartId == cart.cartId;
    }

    @Override
    public int hashCode() {
        return Objects.hash(cartId);
    }

    @Override
    public String toString() {
        return "Cart{" +
                "cartId=" + cartId +
                ", user=" + user +
                ", book=" + book +
                '}';
    }
}
