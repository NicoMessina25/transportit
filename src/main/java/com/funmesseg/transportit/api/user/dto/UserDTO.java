package com.funmesseg.transportit.api.user.dto;

import jakarta.persistence.Column;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserDTO {
    private Long user;
    private String firstname;
    private String lastname;
    private String username;
    private String password;
    private String mail;
    private Long document;
}
