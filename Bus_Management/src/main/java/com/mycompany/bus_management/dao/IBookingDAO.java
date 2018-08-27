/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.dao;

import com.mycompany.bus_management.domain.Booking;
import com.mycompany.bus_management.domain.BusInfo;
import java.util.List;

/**
 *
 * @author Naznin34
 */
public interface IBookingDAO {
     List<Booking> getAllBooking();

   Booking getBookingById(int bookId);

    void addBooking(Booking booking);

    void updateBooking(Booking booking);

    void deleteBooking(int bookId);

    boolean BookingExists(int scheduleid,int passengerid,int busid, String bookstatus); 
}
