/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.service;

import com.mycompany.bus_management.dao.IBusScheduleDAO;
import com.mycompany.bus_management.domain.BusSchedule;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Naznin34
 */
@Service
public class BusScheduleService implements IBusScheduleService{

    @Autowired
    private IBusScheduleDAO iBusScheduleDAO;
    
    @Override
    public List<BusSchedule> getAllObject() {
         return iBusScheduleDAO.getAllObject();
    }

    @Override
    public BusSchedule getObjectById(int id) {
         BusSchedule obj = iBusScheduleDAO.getObjectById(id);
        return obj;
    }

    @Override
    public synchronized boolean addObject(BusSchedule obj) {
       if ( iBusScheduleDAO.objectExists(obj.getBusInfo().getBusId(), obj.getDepartPlace())) {
            return false;
        } else {
            iBusScheduleDAO.addObject(obj);
            return true;
        }
    }

    @Override
    public void updateObject(BusSchedule obj) {
       iBusScheduleDAO.updateObject(obj);
    }

    @Override
    public void deleteObject(int id) {
         iBusScheduleDAO.deleteObject(id);
    }
    
}
