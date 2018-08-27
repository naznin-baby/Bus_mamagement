/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.controller;

import com.mycompany.bus_management.domain.BusSchedule;
import com.mycompany.bus_management.domain.SaleAccount;
import com.mycompany.bus_management.service.IBusScheduleService;
import com.mycompany.bus_management.service.ISealAccountService;
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
@RequestMapping("/sealaccount")
public class SaleAccountController {

    @Autowired
    private ISealAccountService iSaleAccountService;
    
      @RequestMapping("/home")
    public String home() {
        return "sealaccount";
    }
    
    @RequestMapping(value = "/sealaccount", method = RequestMethod.GET)
    public ResponseEntity<List<SaleAccount>> getAllSaleAccount() {
        List<SaleAccount> list = iSaleAccountService.getAllObject();
        return new ResponseEntity<List<SaleAccount>>(list, HttpStatus.OK);
    }
    
     @RequestMapping(value = "/sealaccount/{id}", method = RequestMethod.GET)
    public ResponseEntity<SaleAccount> getObjectById(@PathVariable("id") Integer id) {
        SaleAccount sa = iSaleAccountService.getObjectById(id);
        return new ResponseEntity<SaleAccount>(sa, HttpStatus.OK);
    }
    
     @RequestMapping(value = "/sealaccount", method = RequestMethod.POST)
    public ResponseEntity<Void> addObject(@RequestBody SaleAccount sa, UriComponentsBuilder builder) {
        boolean flag = iSaleAccountService.addObject(sa);
        if (flag == false) {
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/sealaccount/{id}").buildAndExpand(sa.getId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
    
     @RequestMapping(value = "/sealaccount/{id}", method = RequestMethod.PUT)
    public ResponseEntity<SaleAccount> updateObject(@RequestBody SaleAccount busInfo) {
        iSaleAccountService.updateObject(busInfo);
        return new ResponseEntity<SaleAccount>(busInfo, HttpStatus.OK);
    }

    @RequestMapping(value = "/sealaccount/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteObject(@PathVariable("id") Integer id) {
         iSaleAccountService.deleteObject(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }
}
