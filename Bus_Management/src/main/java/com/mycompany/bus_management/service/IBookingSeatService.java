/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.service;

import com.mycompany.bus_management.domain.BookingSeat;
import java.util.List;

/**
 *
 * @author Baby
 */
public interface IBookingSeatService {
    
     List<BookingSeat> getAllBookingSeat();

    BookingSeat getBookingSeatById(int bookSeatId);

    boolean addBookingSeat(BookingSeat bookingseat);

    void updateBookingSeat(BookingSeat bookingseat);

    void deleteBookingSeat(int bookSeatId);
        
    
}
