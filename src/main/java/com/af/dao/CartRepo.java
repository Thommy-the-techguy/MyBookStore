package com.af.dao;

import com.af.entity.Cart;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Repository
@Transactional
public interface CartRepo extends CrudRepository<Cart, Long> {
    @Modifying
    @Query("delete from Cart c where c.user.userId = :userId")
    void deleteAllByUserId(@Param("userId") int userId);

    @Query("from Cart c where c.user.userId = :userId and c.book.bookId = :bookId")
    Optional<Cart> getCartByUserIdAndBookId(@Param("userId") int userId, @Param("bookId") long bookId);
}
