package com.funmesseg.transportit.api.feepayment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.funmesseg.transportit.api.feepayment.dto.FeePaymentDTO;
import com.funmesseg.transportit.dao.feepayment.FeePaymentDAO;
import com.funmesseg.transportit.model.FeePayment;

@RestController
@RequestMapping("/api/feepayment")
public class FeePaymentAPI {

    @Autowired
    private FeePaymentDAO feePaymentDAO;
    
    @GetMapping(value = "/getFeePayments")
    public List<FeePayment> getFeePayments(){
        return feePaymentDAO.getFeePayments();
    }

    @GetMapping("/getFeePaymentById")
    public FeePayment getFeePaymentById(@RequestParam int feePaymentId){
        return feePaymentDAO.getFeePaymentById(feePaymentId);
    }

    @PostMapping("/saveFeePayment")
    public void saveFeePayment(@RequestBody FeePaymentDTO feePaymentDTO){
        feePaymentDAO.saveFeePayment(feePaymentDTO);
    }

    public void deleteFeePayment(int feePaymentId){

    }
    
}
