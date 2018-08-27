/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.controller;

import com.mycompany.bus_management.domain.Route;
import com.mycompany.bus_management.domain.Salary;
import com.mycompany.bus_management.service.IRouteService;
import com.mycompany.bus_management.service.ISalaryService;
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
@RequestMapping("/salary")
public class SalaryController {
    
      @Autowired
    private ISalaryService iSalaryService;
      
       @RequestMapping("/home")
    public String home() {
        return "salary";
    }
    
     @RequestMapping(value = "/salary/{id}", method = RequestMethod.GET)
    public ResponseEntity<Salary> getSalaryById(@PathVariable("id") Integer id) {
        Salary sa = iSalaryService.getSalaryById(id);
        return new ResponseEntity<Salary>(sa, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/salary", method = RequestMethod.GET)
    public ResponseEntity<List<Salary>> getAllSalary() {
        List<Salary> list = iSalaryService.getAllSalary();
        return new ResponseEntity<List<Salary>>(list, HttpStatus.OK);
    }
     @RequestMapping(value = "/salary", method = RequestMethod.POST)
    public ResponseEntity<Void> addSalary(@RequestBody Salary sa, UriComponentsBuilder builder) {
        boolean flag =  iSalaryService.addSalary(sa);
        if (flag == false) {
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/salary/{id}").buildAndExpand(sa.getSalaryId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
    
     @RequestMapping(value = "/salary/{id}", method = RequestMethod.PUT)
    public ResponseEntity<Salary> updateSalary(@RequestBody Salary sa) {
       iSalaryService.updateSalary(sa);
        return new ResponseEntity<Salary>(sa, HttpStatus.OK);
    }

    @RequestMapping(value = "/salary/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteSalary(@PathVariable("id") Integer id) {
        iSalaryService.deleteSalary(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }
}
