/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.service;

import com.mycompany.bus_management.dao.IBookingSeatDAO;
import com.mycompany.bus_management.domain.BookingSeat;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Baby
 */
@Service
public class BookingSeatService implements IBookingSeatService{

     @Autowired
    private IBookingSeatDAO iBookingSeatDAO;
    @Override
    public List<BookingSeat> getAllBookingSeat() {
        return iBookingSeatDAO.getAllBookingSeat();
    }

    @Override
    public BookingSeat getBookingSeatById(int bookSeatId) {
        BookingSeat bookingseat = iBookingSeatDAO.getBookingSeatById(bookSeatId);
        return bookingseat;
    }

    @Override
    public boolean addBookingSeat(BookingSeat bookingseat) {
      if ( iBookingSeatDAO.BookingSeatExists( bookingseat.getSeatNo())) {
            return false;
        } else {
            iBookingSeatDAO.addBookingSeat(bookingseat);
            return true;
        }
    }

    @Override
    public void updateBookingSeat(BookingSeat bookingseat) {
        iBookingSeatDAO.updateBookingSeat(bookingseat);
    }

    @Override
    public void deleteBookingSeat(int bookSeatId) {
         iBookingSeatDAO.deleteBookingSeat(bookSeatId);
    }
    
}
