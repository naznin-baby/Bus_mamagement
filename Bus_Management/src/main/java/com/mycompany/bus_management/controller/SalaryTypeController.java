/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.controller;

import com.mycompany.bus_management.domain.Route;
import com.mycompany.bus_management.domain.SalaryType;
import com.mycompany.bus_management.service.IRouteService;
import com.mycompany.bus_management.service.ISalaryTypeService;
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
@RequestMapping("/salarytype")
public class SalaryTypeController {
    
    
     @Autowired
    private ISalaryTypeService iSalaryTypeService;
     
    
     
      @RequestMapping("/home")
    public String home() {
        return "salarytype";
    }
    
     
    @RequestMapping(value = "/salarytype/{id}", method = RequestMethod.GET)
    public ResponseEntity<SalaryType> getSalaryTypeById(@PathVariable("id") Integer id) {
        SalaryType stype = iSalaryTypeService.getSalaryTypeById(id);
        return new ResponseEntity<SalaryType>(stype, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/salarytype", method = RequestMethod.GET)
    public ResponseEntity<List<SalaryType>> getAllSalaryType() {
        List<SalaryType> list = iSalaryTypeService.getAllSalaryType();
        return new ResponseEntity<List<SalaryType>>(list, HttpStatus.OK);
    }
    
     @RequestMapping(value = "/salarytype", method = RequestMethod.POST)
    public ResponseEntity<Void> addSalaryType(@RequestBody SalaryType stype, UriComponentsBuilder builder) {
        boolean flag =  iSalaryTypeService.addSalaryType(stype);
        if (flag == false) {
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/salarytype/{id}").buildAndExpand(stype.getSalaryType()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/salarytype/{id}", method = RequestMethod.PUT)
    public ResponseEntity<SalaryType> updateRoute(@RequestBody SalaryType stype) {
       iSalaryTypeService.updateSalaryType(stype);
        return new ResponseEntity<SalaryType>(stype, HttpStatus.OK);
    }

    @RequestMapping(value = "/salarytype/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteSalaryType(@PathVariable("id") Integer id) {
        iSalaryTypeService.deleteSalaryType(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }
}
