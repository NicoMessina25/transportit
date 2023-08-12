package com.funmesseg.transportit.api.truck.dto;

import java.util.Date;

import com.funmesseg.transportit.model.City;
import com.funmesseg.transportit.model.Driver;

import jakarta.persistence.Column;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TruckDTO {

    private Long truck;

    private Driver driver;

    private Date dischargedate;

    private String tuition;

    private float maxweight;

    private boolean available;

    private City city;
    
}
