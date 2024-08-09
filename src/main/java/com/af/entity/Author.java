package com.af.entity;

import jakarta.persistence.*;

@Entity
public class Author {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long author_id;
    @Column(name = "first_name")
    private String firstName;
    @Column(name = "last_name")
    private String lastName;


    protected Author() {

    }

    public Author(String firstName, String lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }


    public long getAuthor_id() {
        return author_id;
    }

    public String getAuthor_name() {
        return this.firstName + " " + this.lastName;
    }

    public void setAuthor_id(long author_id) {
        this.author_id = author_id;
    }

    public void setFirstName(String firstName) {

    }

    public void setLastName(String lastName) {

    }

    @Override
    public String toString() {
        return "Author{" +
                "author_id=" + author_id +
                ", author_name='" + getAuthor_name() + '\'' +
                '}';
    }
}
