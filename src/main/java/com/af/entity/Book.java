package com.af.entity;

import jakarta.persistence.*;

import java.util.List;


@Entity
@Table(name = "book")
public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "book_id")
    private long bookId;
    @Column(name = "book_name")
    private String bookName;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "authors_id")
    private Author author;
    private String description;
    @Column(name = "image_path")
    private String imagePath;
    private float price;
    private float rating;
    private short year;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "book")
    private List<BookCategory> bookCategories;
    @OneToMany(mappedBy = "book")
    private List<Cart> cart;


    protected Book() {

    }

    public Book(String bookName, Author author, String description, String imagePath) {
        this.bookName = bookName;
        this.author = author;
        this.description = description;
        this.imagePath = imagePath;
    }


    public long getBookId() {
        return bookId;
    }

    public String getBookName() {
        return this.bookName;
    }

    public Author getAuthor() {
        return this.author;
    }

    public String getDescription() {
        return this.description;
    }

    public String getImagePath() {
        return this.imagePath;
    }

    public float getPrice() {
        return this.price;
    }

    public float getRating() {
        return this.rating;
    }

    public short getYear() {
        return this.year;
    }

    public List<Cart> getCartList() { return this.cart; }

    public List<BookCategory> getBookCategories() {
        return this.bookCategories;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public void setYear(short year) {
        this.year = year;
    }

    @Override
    public String toString() {
        return "Book{" +
                "imagePath='" + imagePath + '\'' +
                ", description='" + description + '\'' +
                ", bookName='" + bookName + '\'' +
                ", bookId=" + bookId +
                '}';
    }
}
