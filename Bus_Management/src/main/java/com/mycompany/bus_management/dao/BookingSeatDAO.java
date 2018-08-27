/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.dao;

import com.mycompany.bus_management.domain.BookingSeat;
import com.mycompany.bus_management.domain.BusSchedule;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Naznin34
 */
@Transactional
@Repository
public class BookingSeatDAO implements IBookingSeatDAO{
    
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public List<BookingSeat> getAllBookingSeat() {
         String hql = "FROM BookingSeat b LEFT JOIN FETCH  b.booking LEFT JOIN FETCH  b.booking.busSchedule LEFT JOIN FETCH  b.busInfo LEFT JOIN FETCH  b.passenger ORDER BY b.bookSeatId";
        return (List<BookingSeat>) hibernateTemplate.find(hql);
    }

    @Override
    public BookingSeat getBookingSeatById(int bookSeatId) {
         return hibernateTemplate.get(BookingSeat.class,  bookSeatId);
    }

    @Override
    public void addBookingSeat(BookingSeat bookingseat) {
         hibernateTemplate.save(bookingseat);
    }

    @Override
    public void updateBookingSeat(BookingSeat bookingseat) {
         BookingSeat bs = getBookingSeatById(bookingseat.getBookSeatId());
        bs.setBooking(bookingseat.getBooking());
        bs.setBusInfo(bookingseat.getBusInfo());
        bs.setPassenger(bookingseat.getPassenger());
        bs.setSeatNo(bookingseat.getSeatNo());
//       bs.setSeatName(bookingseat.getSeatName());
        hibernateTemplate.update(bs);
    }

    @Override
    public void deleteBookingSeat(int bookSeatId) {
         hibernateTemplate.delete(getBookingSeatById(bookSeatId));
    }

    @Override
    public synchronized boolean BookingSeatExists(String seatNo) {
       String hql = "FROM BookingSeat as b WHERE b.seatNo = ?";
        List<BookingSeat> list = (List<BookingSeat>) hibernateTemplate.find(hql,  seatNo);
        return list.size() > 0 ? true : false;
    }
    
}
