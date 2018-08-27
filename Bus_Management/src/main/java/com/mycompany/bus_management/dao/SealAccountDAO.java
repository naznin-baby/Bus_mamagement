/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.dao;

import com.mycompany.bus_management.domain.BusSchedule;
import com.mycompany.bus_management.domain.SaleAccount;
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
public class SealAccountDAO implements ISealAccountDAO{

     @Autowired
    private HibernateTemplate hibernateTemplate;
     
    @Override
    public List<SaleAccount> getAllObject() {
       String hql = "FROM SaleAccount b LEFT JOIN FETCH  b.busInfo LEFT JOIN FETCH  b.route LEFT JOIN FETCH  b.busSchedule ORDER BY b.id";
        return (List<SaleAccount>) hibernateTemplate.find(hql);
    }

    @Override
    public SaleAccount getObjectById(int id) {
        return hibernateTemplate.get(SaleAccount.class, id);
    }

    @Override
    public void addObject(SaleAccount obj) {
         hibernateTemplate.save(obj);
    }

    @Override
    public void updateObject(SaleAccount obj) {
        SaleAccount b = getObjectById(obj.getId());
        b.setBusInfo(obj.getBusInfo());
//        b.setEmployee(obj.getEmployee());
        b.setRoute(obj.getRoute());
        b.setBusSchedule(obj.getBusSchedule());
        b.setAmountOfTicket(obj.getAmountOfTicket());
        b.setTicketPrice(obj.getTicketPrice());
        b.setTotalPrice(obj.getTicketPrice());
//        b.setDepartPlace(obj.getDepartPlace());
//        b.setBookings(obj.getBookings()); 
       b.setSaleDate(obj.getSaleDate());
        hibernateTemplate.update(b);
    }

    @Override
    public void deleteObject(int id) {
         hibernateTemplate.delete(getObjectById(id));
    }

    @Override
    public boolean objectExists(String busModel) {
          String hql = "FROM SaleAccount as b WHERE b.busInfo.busModel = ? ";
        List<SaleAccount> list = (List<SaleAccount>) hibernateTemplate.find(hql,busModel  );
        return list.size() > 0 ? true : false;
    }
    
}
