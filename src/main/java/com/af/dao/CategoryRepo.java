package com.af.dao;

import com.af.entity.Category;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CategoryRepo extends CrudRepository<Category, Integer> {
    @Query("from Category")
    List<Category> getAll();
}
