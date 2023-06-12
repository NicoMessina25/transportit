package com.funmesseg.transportit.dao.user;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.api.user.dto.UserDTO;
import com.funmesseg.transportit.model.User;

import jakarta.persistence.EntityManager;

@Repository
public class UserDAO {

    @Autowired
    private EntityManager entityManager;
    
    @Transactional(readOnly = true)
    public List<User> getUsers(){
        return entityManager.createQuery("from User", User.class).getResultList();
    }

    @Transactional(readOnly = true)
    public User getUserById(int userId){
        return entityManager.find(User.class, userId);
    }

    @Transactional
    public void saveUser(UserDTO userDTO){
        User user = new User();

        user.setFirstname(userDTO.getFirstname());
        user.setLastname(userDTO.getLastname());
        user.setDocument(userDTO.getDocument());
        user.setMail(userDTO.getMail());
        user.setPassword(userDTO.getPassword());
        user.setUsername(userDTO.getUsername());

        entityManager.persist(user);
    }

    @Transactional
    public void deleteUser(int userId){

    }

}
