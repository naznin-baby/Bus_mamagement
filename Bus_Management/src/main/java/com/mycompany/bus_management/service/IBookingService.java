/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.service;

import com.mycompany.bus_management.domain.Booking;
import com.mycompany.bus_management.domain.BusSchedule;
import java.util.List;

/**
 *
 * @author Baby
 */
public interface IBookingService {
    List<Booking> getAllBooking();

    Booking getBookingById(int bookId);

    boolean addBooking(Booking booking);

    void updateBooking(Booking booking);

    void deleteBooking(int bookId);
}
