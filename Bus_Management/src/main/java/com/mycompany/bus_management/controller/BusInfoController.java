/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.controller;

import com.mycompany.bus_management.domain.BusInfo;
import com.mycompany.bus_management.service.BusInfoService;
import com.mycompany.bus_management.service.IBusInfoService;
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
@RequestMapping("/businfo")
public class BusInfoController {
    @Autowired
    private IBusInfoService businfoService;
    
     @RequestMapping("/home")
    public String home() {
        return "businfo";
    }
    
     @RequestMapping(value = "/businfo/{id}", method = RequestMethod.GET)
    public ResponseEntity<BusInfo> getBusInfoById(@PathVariable("id") Integer id) {
        BusInfo businfo = businfoService.getBusInfoById(id);
        return new ResponseEntity<BusInfo>(businfo, HttpStatus.OK);
    }
     @RequestMapping(value = "/businfo", method = RequestMethod.GET)
    public ResponseEntity<List<BusInfo>> getAllBusInfo() {
        List<BusInfo> list = businfoService.getAllBusInfo();
        return new ResponseEntity<List<BusInfo>>(list, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/businfo", method = RequestMethod.POST)
    public ResponseEntity<Void> addBusInfo(@RequestBody BusInfo businfo, UriComponentsBuilder builder) {
        boolean flag = businfoService.addBusInfo(businfo);
        if (flag == false) {
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/businfo/{id}").buildAndExpand(businfo.getBusId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/businfo/{id}", method = RequestMethod.PUT)
    public ResponseEntity<BusInfo> updateBusInfo(@RequestBody BusInfo businfo) {
        businfoService.updateBusInfo(businfo);
        return new ResponseEntity<BusInfo>(businfo, HttpStatus.OK);
    }

    @RequestMapping(value = "/businfo/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteBusInfo(@PathVariable("id") Integer id) {
        businfoService.deleteBusInfo(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }
}
