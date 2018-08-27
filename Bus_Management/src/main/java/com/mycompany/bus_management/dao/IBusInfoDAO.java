/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.dao;

import com.mycompany.bus_management.domain.BusInfo;
import java.util.Date;
import java.util.List;
import java.util.Set;

/**
 *
 * @author Naznin34
 */
public interface IBusInfoDAO {
     List<BusInfo> getAllBusInfo();

   BusInfo getBusInfoById(int busId);

    void addBusInfo(BusInfo businfo);

    void updateBusInfo(BusInfo businfo);

    void deleteBusInfo(int busId);

    boolean businfoExists(String busRegNo, String busModel); 
}
