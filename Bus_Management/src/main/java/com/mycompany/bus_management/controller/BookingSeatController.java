/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.controller;

import com.mycompany.bus_management.domain.Booking;
import com.mycompany.bus_management.domain.BookingSeat;
import com.mycompany.bus_management.service.IBookingSeatService;
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
@RequestMapping("/bookingseat")
public class BookingSeatController {
    
     @Autowired
    private IBookingSeatService iBookingSeatService;
     
     
     @RequestMapping("/home")
    public String home() {
        return "bookingseat";
    }
    @RequestMapping(value = "/bookingseat/{id}", method = RequestMethod.GET)
    public ResponseEntity<BookingSeat> getBookingSeatById(@PathVariable("id") Integer id) {
        BookingSeat bookingseat = iBookingSeatService.getBookingSeatById(id);
        return new ResponseEntity<BookingSeat>(bookingseat, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/bookingseat", method = RequestMethod.GET)
    public ResponseEntity<List<BookingSeat>> getAllBookingSeat() {
        List<BookingSeat> list = iBookingSeatService.getAllBookingSeat();
        return new ResponseEntity<List<BookingSeat>>(list, HttpStatus.OK);
    }
     @RequestMapping(value = "/bookingseat", method = RequestMethod.POST)
    public ResponseEntity<Void> addBookingSeat(@RequestBody BookingSeat bookingseat, UriComponentsBuilder builder) {
        boolean flag = iBookingSeatService.addBookingSeat(bookingseat);
        if (flag == false) {
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/bookingseat/{id}").buildAndExpand(bookingseat.getBookSeatId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
}
    @RequestMapping(value = "/bookingseat/{id}", method = RequestMethod.PUT)
    public ResponseEntity<BookingSeat> updateBookingSeat(@RequestBody BookingSeat bookingseat) {
       iBookingSeatService.updateBookingSeat(bookingseat);
        return new ResponseEntity<BookingSeat>(bookingseat, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/bookingseat/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteBookingSeat(@PathVariable("id") Integer id) {
         iBookingSeatService.deleteBookingSeat(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }
}
