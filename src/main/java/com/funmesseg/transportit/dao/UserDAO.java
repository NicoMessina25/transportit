package com.funmesseg.transportit.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.funmesseg.transportit.model.User;

import jakarta.persistence.EntityManager;

@Repository
public class UserDAO {

    @Autowired
    private EntityManager entityManager;
    
    public List<User> getUsers(){
        return entityManager.createQuery("from User", User.class).getResultList();
    }

    public User getUserById(int userId){
        return null;
    }

    public void saveUser(User user){

    }

    public void deleteUser(int userId){

    }

}
