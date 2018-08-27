/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.dao;

import com.mycompany.bus_management.domain.BusInfo;
import com.mycompany.bus_management.domain.Route;
import java.util.List;

/**
 *
 * @author Naznin34
 */
public interface IRouteDAO {
    List<Route> getAllRoute();

   Route getRouteById(int routeId);

    void addRoute(Route route);

    void updateRoute(Route route);

    void deleteRoute(int routeId);

    boolean RouteExists(String routename,String destination);
}
