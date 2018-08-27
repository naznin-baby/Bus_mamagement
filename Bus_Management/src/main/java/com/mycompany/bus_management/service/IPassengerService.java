/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.service;

import com.mycompany.bus_management.domain.Passenger;
import java.util.List;

/**
 *
 * @author Baby
 */
public interface IPassengerService {
    List<Passenger> getAllPassenger();

  Passenger getPassengerById(int passId);

    boolean addPassenger(Passenger passenger);

    void updatePassenger(Passenger passenger);

    void deletePassenger(int passId);
}
