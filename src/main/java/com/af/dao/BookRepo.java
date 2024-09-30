package com.af.dao;

import com.af.entity.Book;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookRepo extends CrudRepository<Book, Long> {
    @Query("from Book")
    List<Book> getAll();

    @Query("from Book b join BookCategory bc on b.bookId = bc.book.bookId where bc.category.categoryId = :categoryId")
    List<Book> getBooksByCategory(@Param("categoryId") int categoryId);

    @Query("from Book b join BookCategory bc on b.bookId = bc.book.bookId where bc.category.categoryId = :categoryId and b.author.authorId in :authorIds")
    List<Book> getBooksByCategoryAndAuthor(@Param("categoryId") int categoryId, @Param("authorIds") List<Long> authorIds);

    @Query("from Book b join BookCategory bc on b.bookId = bc.book.bookId where bc.category.categoryId = :categoryId and b.year in :bookYears")
    List<Book> getBooksByCategoryAndYear(@Param("categoryId") int categoryId, @Param("bookYears") List<Integer> bookYears);

    @Query("from Book b " +
            "join BookCategory bc on b.bookId = bc.book.bookId " +
            "where bc.category.categoryId = :categoryId " +
            "and b.author.authorId in :authorIds " +
            "and b.year in :bookYears")
    List<Book> getBooksByCategoryAndAuthorAndBookYear(@Param("categoryId") int categoryId,
                                                      @Param("authorIds") List<Long> authorIds,
                                                      @Param("bookYears") List<Integer> bookYears);

    @Query("from Book b where lower(b.bookName) like lower(:name)")
    List<Book> getBookByBookNameLike(@Param("name") String name);
}
