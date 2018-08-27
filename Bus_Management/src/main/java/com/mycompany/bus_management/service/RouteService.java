/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.service;

import com.mycompany.bus_management.dao.IBusScheduleDAO;
import com.mycompany.bus_management.dao.IRouteDAO;
import com.mycompany.bus_management.domain.BusSchedule;
import com.mycompany.bus_management.domain.Route;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Naznin34
 */
@Service
public class RouteService implements IRouteService{
    
    
    @Autowired
    private IRouteDAO iRouteDAO;
    
    @Override
    public List<Route> getAllRoute() {
       return iRouteDAO.getAllRoute(); 
    }

    @Override
    public Route getRouteById(int routeId) {
      Route route = iRouteDAO.getRouteById(routeId);
        return route; 
    }

    @Override
    public boolean addRoute(Route route) {
        if (iRouteDAO.RouteExists(route.getRouteName(),route.getDestination())) {
            return false;
        } else {
            iRouteDAO.addRoute(route);
            return true;
        }
    }

    @Override
    public void updateRoute(Route route) {
       iRouteDAO.updateRoute(route);
    }

    @Override
    public void deleteRoute(int routeId) {
        iRouteDAO.deleteRoute(routeId);
    }
    
}
