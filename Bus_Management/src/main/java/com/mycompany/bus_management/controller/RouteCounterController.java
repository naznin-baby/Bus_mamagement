/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.controller;

import com.mycompany.bus_management.domain.Payment;
import com.mycompany.bus_management.domain.RouteCounter;
import com.mycompany.bus_management.service.IPaymentService;
import com.mycompany.bus_management.service.IRouteCounterService;
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
@RequestMapping("/routecounter")
public class RouteCounterController {
    
    @Autowired
    private IRouteCounterService iRouteCounterService;
    
      @RequestMapping("/home")
    public String home() {
        return "routecounter";
    }
     @RequestMapping(value = "/routecounter/{id}", method = RequestMethod.GET)
    public ResponseEntity<RouteCounter> getRouteCounterById(@PathVariable("id") Integer id) {
        RouteCounter routecounter = iRouteCounterService.getRouteCounterById(id);
        return new ResponseEntity<RouteCounter>(routecounter, HttpStatus.OK);
    }
    @RequestMapping(value = "/routecounter", method = RequestMethod.GET)
    public ResponseEntity<List<RouteCounter>> getAllRouteCounter() {
        List<RouteCounter> list = iRouteCounterService.getAllRouteCounter();
        return new ResponseEntity<List<RouteCounter>>(list, HttpStatus.OK);
    }
    
    
    @RequestMapping(value = "/routecounter", method = RequestMethod.POST)
    public ResponseEntity<Void> addRouteCounter(@RequestBody RouteCounter routecounter, UriComponentsBuilder builder) {
        boolean flag = iRouteCounterService.addRouteCounter(routecounter);
        if (flag == false) {
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/routecounter/{id}").buildAndExpand(routecounter.getCounterId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
    
     @RequestMapping(value = "/routecounter/{id}", method = RequestMethod.PUT)
    public ResponseEntity<RouteCounter> updateRouteCounter(@RequestBody RouteCounter routecounter) {
        iRouteCounterService.updateRouteCounter(routecounter);
        return new ResponseEntity<RouteCounter>(routecounter, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/routecounter/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteRouteCounter(@PathVariable("id") Integer id) {
        iRouteCounterService.deleteRouteCounter(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }
}
