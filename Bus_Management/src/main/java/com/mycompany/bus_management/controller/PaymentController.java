/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.controller;

import com.mycompany.bus_management.domain.Passenger;
import com.mycompany.bus_management.domain.Payment;
import com.mycompany.bus_management.service.IPassengerService;
import com.mycompany.bus_management.service.IPaymentService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.UriComponentsBuilder;

/**
 *
 * @author Naznin34
 */
@Controller
@RequestMapping("/payment")
public class PaymentController {
    
    @Autowired
    private IPaymentService iPaymentService;
    
    
     @RequestMapping("/home")
    public String home() {
        return "payment";
    }
    
    @RequestMapping(value = "/payment/{id}", method = RequestMethod.GET)
    public ResponseEntity<Payment> getPaymentById(@PathVariable("id") Integer id) {
        Payment payment = iPaymentService.getPaymentById(id);
        return new ResponseEntity<Payment>(payment, HttpStatus.OK);
    }
    
     @RequestMapping(value = "/payment", method = RequestMethod.GET)
    public ResponseEntity<List<Payment>> getAllPayment() {
        List<Payment> list = iPaymentService.getAllPayment();
        return new ResponseEntity<List<Payment>>(list, HttpStatus.OK);
    }
     @RequestMapping(value = "/payment", method = RequestMethod.POST)
    public ResponseEntity<Void> addPayment(@RequestBody Payment payment, UriComponentsBuilder builder) {
        boolean flag = iPaymentService.addPayment(payment);
        if (flag == false) {
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/payment/{id}").buildAndExpand(payment.getPayId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/payment/{id}", method = RequestMethod.PUT)
    public ResponseEntity<Payment> updatePayment(@RequestBody Payment payment) {
        iPaymentService.updatePayment(payment);
        return new ResponseEntity<Payment>(payment, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/payment/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deletePayment(@PathVariable("id") Integer id) {
        iPaymentService.deletePayment(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }
}
