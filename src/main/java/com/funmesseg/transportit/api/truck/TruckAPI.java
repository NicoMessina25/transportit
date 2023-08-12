package com.funmesseg.transportit.api.truck;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.funmesseg.transportit.api.truck.dto.TruckDTO;
import com.funmesseg.transportit.dao.truck.TruckDAO;
import com.funmesseg.transportit.model.Truck;

@RestController
@RequestMapping("/api/truck")
public class TruckAPI {
    
    @Autowired
    private TruckDAO truckDAO;
    
    @GetMapping(value = "/getTruck")
    public List<Truck> getTrucks(){
        return truckDAO.getTrucks();
    }

    @GetMapping("/getTruckById")
    public Truck getTruckById(@RequestParam int truckId){
        return truckDAO.getTruckById(truckId);
    }

    @PostMapping("/saveTruck")
    public void saveTruck(@RequestBody TruckDTO truckDTO){
        truckDAO.saveTruck(truckDTO);
    }

    public void deletetruck(int truckId){

    }

}
