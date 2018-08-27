/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.controller;

import com.mycompany.bus_management.domain.BusInfo;
import com.mycompany.bus_management.domain.Passenger;
import com.mycompany.bus_management.service.IBusInfoService;
import com.mycompany.bus_management.service.IPassengerService;
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
@RequestMapping("/passenger")
public class PassengerController {
    
    @Autowired
    private IPassengerService iPassengerService;
    
    
     @RequestMapping("/home")
    public String home() {
        return "passenger";
    }
     @RequestMapping(value = "/passenger/{id}", method = RequestMethod.GET)
    public ResponseEntity<Passenger> getPassengerById(@PathVariable("id") Integer id) {
        Passenger passenger = iPassengerService.getPassengerById(id);
        return new ResponseEntity<Passenger>(passenger, HttpStatus.OK);
    }
    
    
    @RequestMapping(value = "/passenger", method = RequestMethod.GET)
    public ResponseEntity<List<Passenger>> getAllPassenger() {
        List<Passenger> list = iPassengerService.getAllPassenger();
        return new ResponseEntity<List<Passenger>>(list, HttpStatus.OK);
    }
    
     @RequestMapping(value = "/passenger", method = RequestMethod.POST)
    public ResponseEntity<Void> addPassenger(@RequestBody Passenger passenger, UriComponentsBuilder builder) {
        boolean flag = iPassengerService.addPassenger(passenger);
        if (flag == false) {
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/passenger/{id}").buildAndExpand(passenger.getPassId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
   @RequestMapping(value = "/passenger/{id}", method = RequestMethod.PUT)
    public ResponseEntity<Passenger> updatePassenger(@RequestBody Passenger passenger) {
        iPassengerService.updatePassenger(passenger);
        return new ResponseEntity<Passenger>(passenger, HttpStatus.OK);
    }
    
     @RequestMapping(value = "/passenger/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deletePassenger(@PathVariable("id") Integer id) {
        iPassengerService.deletePassenger(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }
}
