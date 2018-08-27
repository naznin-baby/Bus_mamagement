/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.dao;

import com.mycompany.bus_management.domain.Booking;
import com.mycompany.bus_management.domain.BusInfo;
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
public class BookingDAO implements IBookingDAO {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public List<Booking> getAllBooking() {
        String hql = "FROM Booking b LEFT JOIN FETCH  b.busSchedule LEFT JOIN FETCH  b.passenger LEFT JOIN FETCH  b.busInfo LEFT JOIN FETCH  b.routeCounter ORDER BY b.bookId";
        return (List<Booking>) hibernateTemplate.find(hql);
    }

    @Override
    public Booking getBookingById(int bookId) {
        return hibernateTemplate.get(Booking.class, bookId);
    }

    @Override
    public void addBooking(Booking booking) {
        Booking bo = new Booking();
        Integer toseat = booking.getTotalSeat();
        if (toseat <= 4) {
            bo.setPassenger(booking.getPassenger());
            bo.setBusSchedule(booking.getBusSchedule());
            bo.setBookDate(booking.getBookDate());
            bo.setBookStatus(booking.getBookStatus());
            bo.setTotalSeat(toseat);
            bo.setRouteCounter(booking.getRouteCounter());
            hibernateTemplate.save(bo);
        }
    }

    @Override
    public void updateBooking(Booking booking) {
        Booking bo = getBookingById(booking.getBookId());
        Integer toseat = booking.getTotalSeat();
        if (toseat <= 4) {
            bo.setPassenger(booking.getPassenger());
            bo.setBusSchedule(booking.getBusSchedule());
            bo.setBookDate(booking.getBookDate());
            bo.setBookStatus(booking.getBookStatus());
            bo.setTotalSeat(toseat);
            bo.setRouteCounter(booking.getRouteCounter());
            hibernateTemplate.update(bo);
        }
    }

    @Override
    public void deleteBooking(int bookId) {
        hibernateTemplate.delete(getBookingById(bookId));
    }

    @Override
    public boolean BookingExists(int scheduleid, int passengerid, int busid, String bookstatus) {
        String hql = "FROM Booking as b WHERE b.busSchedule.scheduleId = ? and b.passenger.passId=? and b.busInfo.busId=? and b.bookStatus=? ";
        List<Booking> list = (List<Booking>) hibernateTemplate.find(hql, scheduleid, passengerid, busid, bookstatus);
        return list.size() > 0 ? true : false;
    }

}
