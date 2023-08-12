package com.funmesseg.transportit.dao.driver;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.funmesseg.transportit.api.driver.dto.DriverDTO;
import com.funmesseg.transportit.model.Driver;

import jakarta.persistence.EntityManager;

@Repository
public class DriverDAO {
    
    @Autowired
    private EntityManager entityManager;
    
    @Transactional(readOnly = true)
    public List<Driver> getDrivers(){
        return entityManager.createQuery("from driver", Driver.class).getResultList();
    }

    @Transactional(readOnly = true)
    public Driver getDriverById(int driverId){
        return entityManager.find(Driver.class, driverId);
    }

    @Transactional
    public void saveDriver(DriverDTO driverDTO){
        Driver driver = new Driver();

        driver.setFirstname(driverDTO.getFirstname());
        driver.setLastname(driverDTO.getLastname());
        driver.setDni(driverDTO.getDni());
        driver.setAdress(driverDTO.getAdress());
        driver.setProvince(driverDTO.getProvince());
        driver.setCity(driverDTO.getCity());
        driver.setPhone(driverDTO.getPhone());
        driver.setParticular(driverDTO.isParticular());
        driver.setAvailable(driverDTO.isAvailable());
        driver.setFeepayment(driverDTO.getFeepayment());
        driver.setTruck(driverDTO.getTruck());
        driver.setCurrentcity(driverDTO.getCurrentcity());

        entityManager.persist(driver);
    }

    @Transactional
    public void deleteDriver(int userId){

    }


}
