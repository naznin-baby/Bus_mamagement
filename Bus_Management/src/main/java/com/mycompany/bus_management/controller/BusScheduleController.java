/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.controller;

import com.mycompany.bus_management.domain.BusSchedule;
import com.mycompany.bus_management.service.IBusScheduleService;
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
@RequestMapping("/schedule")
public class BusScheduleController {
    
      @Autowired
    private IBusScheduleService iBusScheduleService;
      
       @RequestMapping("/home")
    public String home() {
        return "schedule";
    }
    
     @RequestMapping(value = "/schedulelist", method = RequestMethod.GET)
    public ResponseEntity<List<BusSchedule>> getAllSchedule() {
        List<BusSchedule> list = iBusScheduleService.getAllObject();
        return new ResponseEntity<List<BusSchedule>>(list, HttpStatus.OK);
    }
    
     @RequestMapping(value = "/schedulelist/{id}", method = RequestMethod.GET)
    public ResponseEntity<BusSchedule> getObjectById(@PathVariable("id") Integer id) {
        BusSchedule busSchedule = iBusScheduleService.getObjectById(id);
        return new ResponseEntity<BusSchedule>(busSchedule, HttpStatus.OK);
    }
    
      @RequestMapping(value = "/schedulelist", method = RequestMethod.POST)
    public ResponseEntity<Void> addObject(@RequestBody BusSchedule busSchedule, UriComponentsBuilder builder) {
        boolean flag = iBusScheduleService.addObject(busSchedule);
        if (flag == false) {
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/schedulelist/{id}").buildAndExpand(busSchedule.getScheduleId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
    
     @RequestMapping(value = "/schedulelist/{id}", method = RequestMethod.PUT)
    public ResponseEntity<BusSchedule> updateObject(@RequestBody BusSchedule busInfo) {
        iBusScheduleService.updateObject(busInfo);
        return new ResponseEntity<BusSchedule>(busInfo, HttpStatus.OK);
    }

    @RequestMapping(value = "/schedulelist/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteObject(@PathVariable("id") Integer id) {
         iBusScheduleService.deleteObject(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }
}
