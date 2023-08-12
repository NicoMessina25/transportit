package com.funmesseg.transportit.api.driver.dto;

import com.funmesseg.transportit.model.City;
import com.funmesseg.transportit.model.FeePayment;
import com.funmesseg.transportit.model.Truck;

import jakarta.persistence.Column;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DriverDTO {
    
    private Long driver;

    private String firstname;

    private String lastname;

    private Long dni;
    
    private String adress;

    private String province;

    private String city;

    private Long phone;

    private boolean particular;

    private boolean available;

    private FeePayment feepayment;

    private Truck truck;

    private City currentcity;

}
