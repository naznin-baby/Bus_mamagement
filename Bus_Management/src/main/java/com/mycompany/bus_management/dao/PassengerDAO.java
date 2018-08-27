/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.dao;

import com.mycompany.bus_management.domain.BusInfo;
import com.mycompany.bus_management.domain.BusSchedule;
import com.mycompany.bus_management.domain.Passenger;
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
public class PassengerDAO implements IPassengerDAO{

    
     @Autowired
    private HibernateTemplate hibernateTemplate;
     
     @SuppressWarnings("unchecked")
    @Override
    public List<Passenger> getAllPassenger() {
        String hql = "FROM Passenger as p ORDER BY p.passId";
        return (List<Passenger>) hibernateTemplate.find(hql);
    }

    @Override
    public Passenger getPassengerById(int passId) {
        return hibernateTemplate.get(Passenger.class, passId);
    }

    @Override
    public void addPassenger(Passenger passenger) {
         hibernateTemplate.save(passenger);
    }


    @Override
    public void updatePassenger(Passenger passenger) {
        Passenger pa = getPassengerById(passenger.getPassId());
        pa.setPassName(passenger.getPassName());
        pa.setPassAddress(passenger.getPassAddress());
        pa.setPassMobile(passenger.getPassMobile());
        pa.setRegDate(passenger.getRegDate());
        pa.setEmail(passenger.getEmail());
        pa.setPassPhoto(passenger.getPassPhoto());
        pa.setGender(passenger.getGender());
       
        hibernateTemplate.update(pa);
    }

    @Override
    public void deletePassenger(int passId) {
        hibernateTemplate.delete(getPassengerById(passId));
    }

    @Override
    public boolean PassengerExists(String passName, String email) {
        String hql = "FROM Passenger as p WHERE p.passName = ? and p.email=?";
        List<Passenger> list = (List<Passenger>) hibernateTemplate.find(hql, passName, email);
        return list.size() > 0 ? true : false;
    }
    }
    

