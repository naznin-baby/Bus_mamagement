/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.service;

import com.mycompany.bus_management.dao.IBookingDAO;
import com.mycompany.bus_management.dao.IBusScheduleDAO;
import com.mycompany.bus_management.domain.Booking;
import com.mycompany.bus_management.domain.BusSchedule;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Baby
 */
@Service
public class BookingService implements IBookingService{

     @Autowired
    private IBookingDAO iBookingDAO;
     
    @Override
    public List<Booking> getAllBooking() {
         return iBookingDAO.getAllBooking();
    }

    @Override
    public Booking getBookingById(int bookId) {
        Booking booking = iBookingDAO.getBookingById(bookId);
        return booking;
    }

    @Override
    public synchronized boolean addBooking(Booking booking) {
          if ( iBookingDAO.BookingExists(booking.getBusSchedule().getScheduleId(),booking.getPassenger().getPassId(),booking.getBusInfo().getBusId(), booking.getBookStatus())) {
            return false;
        } else {
            iBookingDAO.addBooking(booking);
            return true;
        }
    }

    @Override
    public void updateBooking(Booking booking) {
        iBookingDAO.updateBooking(booking);
    }

    @Override
    public void deleteBooking(int bookId) {
         iBookingDAO.deleteBooking(bookId);
    }

    
    
}
