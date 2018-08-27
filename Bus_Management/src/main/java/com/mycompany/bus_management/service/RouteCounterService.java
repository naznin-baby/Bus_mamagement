/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.service;

import com.mycompany.bus_management.dao.IPaymentDAO;
import com.mycompany.bus_management.dao.IRouteCounterDAO;
import com.mycompany.bus_management.domain.Payment;
import com.mycompany.bus_management.domain.RouteCounter;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Naznin34
 */

@Service
public class RouteCounterService implements IRouteCounterService{

     @Autowired
    private IRouteCounterDAO iRouteCounterDAO;
    @Override
    public List<RouteCounter> getAllRouteCounter() {
         return iRouteCounterDAO.getAllRouteCounter();  
    }

    @Override
    public RouteCounter getRouteCounterById(int counterId) {
        RouteCounter routecounter = iRouteCounterDAO.getRouteCounterById(counterId);
        return routecounter;
    }

    @Override
    public boolean addRouteCounter(RouteCounter routecounter) {
         iRouteCounterDAO.addRouteCounter(routecounter);
        if (iRouteCounterDAO.RouteCounterExists(routecounter.getRoute().getRouteId(), routecounter.getCounterAddress())){
            return false;
        } else {
            iRouteCounterDAO.addRouteCounter(routecounter);
            return true;
        }  
    }

    @Override
    public void updateRouteCounter(RouteCounter routecounter) {
        iRouteCounterDAO.updateRouteCounter(routecounter); 
    }

    @Override
    public void deleteRouteCounter(int counterId) {
         iRouteCounterDAO.deleteRouteCounter(counterId); 
    }
    
}
