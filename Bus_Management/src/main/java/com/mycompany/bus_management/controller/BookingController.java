/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.controller;

import com.mycompany.bus_management.domain.Booking;
import com.mycompany.bus_management.domain.BusSchedule;
import com.mycompany.bus_management.service.IBookingService;
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
@RequestMapping("/booking")
public class BookingController {
    
    
      @Autowired
    private IBookingService iBookingService;
      
      @RequestMapping("/home")
    public String home() {
        return "booking";
    }
    
    @RequestMapping(value = "/booking", method = RequestMethod.GET)
    public ResponseEntity<List<Booking>> getAllBooking() {
        List<Booking> list = iBookingService.getAllBooking();
        return new ResponseEntity<List<Booking>>(list, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/booking/{id}", method = RequestMethod.GET)
    public ResponseEntity<Booking> getBookingById(@PathVariable("id") Integer id) {
        Booking booking = iBookingService.getBookingById(id);
        return new ResponseEntity<Booking>(booking, HttpStatus.OK);
    }
    
     @RequestMapping(value = "/booking", method = RequestMethod.POST)
    public ResponseEntity<Void> addBooking(@RequestBody Booking booking, UriComponentsBuilder builder) {
        boolean flag = iBookingService.addBooking(booking);
        if (flag == false) {
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/booking/{id}").buildAndExpand(booking.getBookId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/booking/{id}", method = RequestMethod.PUT)
    public ResponseEntity<Booking> updateBooking(@RequestBody Booking booking) {
       iBookingService.updateBooking(booking);
        return new ResponseEntity<Booking>(booking, HttpStatus.OK);
    }
    @RequestMapping(value = "/booking/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteBooking(@PathVariable("id") Integer id) {
         iBookingService.deleteBooking(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }
    
}
