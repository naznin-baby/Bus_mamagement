/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.dao;

import com.mycompany.bus_management.domain.BusInfo;
import com.mycompany.bus_management.domain.Passenger;
import java.util.List;

/**
 *
 * @author Naznin34
 */
public interface IPassengerDAO {
    List<Passenger> getAllPassenger();

  Passenger getPassengerById(int passId);

    void addPassenger(Passenger passenger);

    void updatePassenger(Passenger passenger);

    void deletePassenger(int passId);

    boolean PassengerExists(String passName, String email); 
}
