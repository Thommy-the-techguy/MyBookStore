//package com.af.dao;
//
//import com.af.entity.User;
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Component;
//
//@Component
//public class UserDao {
//    private SessionFactory sessionFactory;
//
//    public UserDao(@Autowired SessionFactory sessionFactory) {
//        this.sessionFactory = sessionFactory;
//    }
//
//    public User findUserByUsername(String username) {
//        User user = null;
//
//        try(Session session = sessionFactory.openSession()) {
//            user = session.createSelectionQuery("from User u where u.username = :username", User.class)
//                    .setParameter("username", username)
//                    .getSingleResultOrNull();
//        }
//
//        return user;
//    }
//}
