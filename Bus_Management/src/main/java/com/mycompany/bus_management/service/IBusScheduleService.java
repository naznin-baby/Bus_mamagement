/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.service;

import com.mycompany.bus_management.domain.BusSchedule;
import java.util.List;

/**
 *
 * @author Naznin34
 */
public interface IBusScheduleService {
     List<BusSchedule> getAllObject();

    BusSchedule getObjectById(int id);

    boolean addObject(BusSchedule obj);

    void updateObject(BusSchedule obj);

    void deleteObject(int id);
}
