/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.service;

import com.mycompany.bus_management.domain.Payment;
import java.util.List;

/**
 *
 * @author Naznin34
 */
public interface IPaymentService {
    
    List<Payment> getAllPayment();

  Payment getPaymentById(int payId);

    boolean addPayment(Payment payment);

    void updatePayment(Payment payment);

    void deletePayment(int payId);
}
