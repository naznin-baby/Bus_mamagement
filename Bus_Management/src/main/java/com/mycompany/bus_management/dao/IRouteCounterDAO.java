/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.dao;

import com.mycompany.bus_management.domain.Payment;
import com.mycompany.bus_management.domain.RouteCounter;
import java.util.List;

/**
 *
 * @author Naznin34
 */
public interface IRouteCounterDAO {
    List<RouteCounter> getAllRouteCounter();

  RouteCounter getRouteCounterById(int counterId);

    void addRouteCounter(RouteCounter routecounter);

    void updateRouteCounter(RouteCounter routecounter);

    void deleteRouteCounter(int counterId);
    boolean RouteCounterExists(int routeId, String counterAddress);
}
