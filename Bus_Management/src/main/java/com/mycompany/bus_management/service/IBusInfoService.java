/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.service;

import com.mycompany.bus_management.domain.BusInfo;
import java.util.List;

/**
 *
 * @author Naznin34
 */
public interface IBusInfoService {
    List<BusInfo> getAllBusInfo();

    BusInfo getBusInfoById(int busId);

    boolean addBusInfo(BusInfo businfo);

    void updateBusInfo(BusInfo businfo);

    void deleteBusInfo(int busId);
}
