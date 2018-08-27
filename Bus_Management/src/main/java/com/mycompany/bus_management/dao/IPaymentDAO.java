/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.dao;

import com.mycompany.bus_management.domain.Payment;
import java.util.List;

/**
 *
 * @author Naznin34
 */
public interface IPaymentDAO {
    List<Payment> getAllPayment();

  Payment getPaymentById(int payId);

    void addPayment(Payment payment);

    void updatePayment(Payment payment);

    void deletePayment(int payId);
    boolean PaymentExists(int passengerid, int numberofticket); 
}
