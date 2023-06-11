package com.funmesseg.transportit.api.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.funmesseg.transportit.dao.UserDAO;
import com.funmesseg.transportit.model.User;

@RestController
@RequestMapping("/api/user")
public class UserAPI {

    @Autowired
    private UserDAO userDAO;
    
    @GetMapping(value = "/getUsers")
    public List<User> getUsers(){
        return userDAO.getUsers();
    }

    public User getUserById(int userId){
        return null;
    }

    public void saveUser(User user){

    }

    public void deleteUser(int userId){

    }
}
