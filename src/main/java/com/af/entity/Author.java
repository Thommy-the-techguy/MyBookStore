package com.af.entity;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "author")
public class Author {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "author_id")
    private long authorId;
    @Column(name = "first_name")
    private String firstName;
    @Column(name = "last_name")
    private String lastName;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "author") //TODO: do smth with lazy init
    private List<Book> books;


    protected Author() {

    }

    public Author(String firstName, String lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }


    public long getAuthorId() {
        return authorId;
    }

    public String getAuthorName() {
        return this.firstName + " " + this.lastName;
    }

    public void setAuthorId(long author_id) {
        this.authorId = author_id;
    }

    public void setFirstName(String firstName) {

    }

    public void setLastName(String lastName) {

    }

    public List<Book> getBooks() {
        return books;
    }

    @Override
    public String toString() {
        return "Author{" +
                "author_id=" + authorId +
                "books=" + books +
                ", author_name='" + getAuthorName() + '\'' +
                '}';
    }
}
