/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.service;

import com.mycompany.bus_management.dao.IBusInfoDAO;
import com.mycompany.bus_management.dao.IPassengerDAO;
import com.mycompany.bus_management.domain.BusInfo;
import com.mycompany.bus_management.domain.Passenger;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Baby
 */
@Service
public class PassengerService implements IPassengerService {

    @Autowired
    private IPassengerDAO ipassengerDAo;

    @Override
    public List<Passenger> getAllPassenger() {
        return ipassengerDAo.getAllPassenger();
    }

    @Override
    public Passenger getPassengerById(int passId) {

        Passenger obj = ipassengerDAo.getPassengerById(passId);
        return obj;
    }

    @Override
    public synchronized boolean addPassenger(Passenger passenger) {
         ipassengerDAo.addPassenger(passenger);
        if (ipassengerDAo.PassengerExists(passenger.getPassName(), passenger.getEmail())){
            return false;
        } else {
            ipassengerDAo.addPassenger(passenger);
            return true;
        }
       
    }

    @Override
    public void updatePassenger(Passenger passenger) {
       ipassengerDAo.updatePassenger(passenger);
    }
@Override
    public void deletePassenger(int passId) {
         ipassengerDAo.deletePassenger(passId);
    }
}
