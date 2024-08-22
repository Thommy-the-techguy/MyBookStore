//package com.af.dao;
//
//import com.af.entity.Category;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//
//import java.util.ArrayList;
//import java.util.List;
//
//@Component
//public class CategoryDao {
//    private final SessionFactory sessionFactory;
//
//    public CategoryDao(@Autowired SessionFactory sessionFactory) {
//        this.sessionFactory = sessionFactory;
//    }
//
//    public List<Category> getAllCategories() {
//        List<Category> categories = new ArrayList<>();
//
//        try(Session session = sessionFactory.openSession()) {
//            categories = session.createSelectionQuery("from Category", Category.class).list();
//        }
//
//        return categories;
//    }
//}
