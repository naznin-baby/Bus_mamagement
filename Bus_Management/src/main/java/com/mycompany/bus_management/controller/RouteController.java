/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.controller;

import com.mycompany.bus_management.domain.BusInfo;
import com.mycompany.bus_management.domain.Route;
import com.mycompany.bus_management.service.IBusInfoService;
import com.mycompany.bus_management.service.IRouteService;
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
@RequestMapping("/route")
public class RouteController {
    
     @Autowired
    private IRouteService iRouteService;
     
      @RequestMapping("/home")
    public String home() {
        return "route";
    }
    
    @RequestMapping(value = "/route/{id}", method = RequestMethod.GET)
    public ResponseEntity<Route> getRouteById(@PathVariable("id") Integer id) {
        Route route = iRouteService.getRouteById(id);
        return new ResponseEntity<Route>(route, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/route", method = RequestMethod.GET)
    public ResponseEntity<List<Route>> getAllRoute() {
        List<Route> list = iRouteService.getAllRoute();
        return new ResponseEntity<List<Route>>(list, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/route", method = RequestMethod.POST)
    public ResponseEntity<Void> addRoute(@RequestBody Route route, UriComponentsBuilder builder) {
        boolean flag =  iRouteService.addRoute(route);
        if (flag == false) {
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/route/{id}").buildAndExpand(route.getRouteId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
    
    
    @RequestMapping(value = "/route/{id}", method = RequestMethod.PUT)
    public ResponseEntity<Route> updateRoute(@RequestBody Route route) {
       iRouteService.updateRoute(route);
        return new ResponseEntity<Route>(route, HttpStatus.OK);
    }

    @RequestMapping(value = "/route/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteRoute(@PathVariable("id") Integer id) {
        iRouteService.deleteRoute(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }
}
