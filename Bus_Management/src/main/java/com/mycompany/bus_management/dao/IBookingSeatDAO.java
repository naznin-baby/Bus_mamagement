/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.dao;

import com.mycompany.bus_management.domain.BookingSeat;
import java.util.List;

/**
 *
 * @author Naznin34
 */
public interface IBookingSeatDAO {
    List<BookingSeat> getAllBookingSeat();

   BookingSeat getBookingSeatById(int bookSeatId);

    void addBookingSeat(BookingSeat bookingseat);

    void updateBookingSeat(BookingSeat bookingseat);

    void deleteBookingSeat(int bookSeatId);

    boolean BookingSeatExists( String seatNo); 
}
