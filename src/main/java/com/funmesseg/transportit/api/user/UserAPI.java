package com.funmesseg.transportit.api.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.funmesseg.transportit.api.user.dto.UserDTO;
import com.funmesseg.transportit.dao.user.UserDAO;
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

    @GetMapping("/getUserById")
    public User getUserById(@RequestParam int userId){
        return userDAO.getUserById(userId);
    }

    @PostMapping("/saveUser")
    public void saveUser(@RequestBody UserDTO userDTO){
        userDAO.saveUser(userDTO);
    }

    public void deleteUser(int userId){

    }
}
