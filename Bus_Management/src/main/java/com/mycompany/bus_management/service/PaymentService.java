/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.service;

import com.mycompany.bus_management.dao.IPassengerDAO;
import com.mycompany.bus_management.dao.IPaymentDAO;
import com.mycompany.bus_management.domain.Passenger;
import com.mycompany.bus_management.domain.Payment;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Naznin34
 */
@Service
public class PaymentService implements IPaymentService{

     @Autowired
    private IPaymentDAO iPaymentDAO;
     
    @Override
    public List<Payment> getAllPayment() {
     return iPaymentDAO.getAllPayment();  
    }

    @Override
    public Payment getPaymentById(int payId) {
       Payment obj = iPaymentDAO.getPaymentById(payId);
        return obj; 
    }

    @Override
    public boolean addPayment(Payment payment) {
      iPaymentDAO.addPayment(payment);
        if (iPaymentDAO.PaymentExists(payment.getPassenger().getPassId(), payment.getNumberOfTicket())){
            return false;
        } else {
            iPaymentDAO.addPayment(payment);
            return true;
        }  
    }

    @Override
    public void updatePayment(Payment payment) {
       iPaymentDAO.updatePayment(payment); 
    }

    @Override
    public void deletePayment(int payId) {
        iPaymentDAO.deletePayment(payId); 
    }
    
}
