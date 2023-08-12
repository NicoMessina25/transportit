package com.funmesseg.transportit.api.driver;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.funmesseg.transportit.api.driver.dto.DriverDTO;
import com.funmesseg.transportit.dao.driver.DriverDAO;
import com.funmesseg.transportit.model.Driver;

@RestController
@RequestMapping("/api/driver")
public class DriverAPI {

    @Autowired
    private DriverDAO driverDAO;

    @GetMapping(value = "/getDrivers")
    public List<Driver> getDrivers(){
        return driverDAO.getDrivers();
    }

    @GetMapping("/getDriverById")
    public Driver getDriverById(@RequestParam int driverId){
        return driverDAO.getDriverById(driverId);
    }

    @PostMapping("/saveUser")
    public void saveDriver(@RequestBody DriverDTO driverDTO){
        driverDAO.saveDriver(driverDTO);
    }

    public void deleteUser(int userId){

    }
    
}
