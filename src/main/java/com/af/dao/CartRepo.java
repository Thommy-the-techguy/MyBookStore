package com.af.dao;

import com.af.entity.Cart;
import com.af.entity.User;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public interface CartRepo extends CrudRepository<Cart, Long> {
    @Modifying
    @Query("delete Cart c where c.user.userId = :userId")
    void deleteAllByUserId(@Param("userId") int userId);
}
