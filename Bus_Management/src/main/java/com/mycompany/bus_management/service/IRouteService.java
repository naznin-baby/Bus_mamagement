/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.service;

import com.mycompany.bus_management.domain.BusSchedule;
import com.mycompany.bus_management.domain.Route;
import java.util.List;

/**
 *
 * @author Naznin34
 */
public interface IRouteService {
     List<Route> getAllRoute();

   Route getRouteById(int routeId);

    boolean addRoute(Route route);

    void updateRoute(Route route);

    void deleteRoute(int routeId);
}
