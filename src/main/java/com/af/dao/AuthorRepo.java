package com.af.dao;

import com.af.entity.Author;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface AuthorRepo extends CrudRepository<Author, Long> {
    @Query("from Author")
    List<Author> getAll();
    Optional<Author> findAuthorByAuthorId(long authorId);
}
