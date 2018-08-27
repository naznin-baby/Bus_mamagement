/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.service;

import com.mycompany.bus_management.dao.IBusInfoDAO;
import com.mycompany.bus_management.domain.BusInfo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Naznin34
 */
@Service
public class BusInfoService implements IBusInfoService {

    @Autowired
    private IBusInfoDAO businfoDAO;

    @Override
    public List<BusInfo> getAllBusInfo() {
        return businfoDAO.getAllBusInfo();
    }

    @Override
    public BusInfo getBusInfoById(int bid) {
        BusInfo obj = businfoDAO.getBusInfoById(bid);
        return obj;
    }

    @Override
    public synchronized boolean addBusInfo(BusInfo businfo) {

        businfoDAO.addBusInfo(businfo);
        if (businfoDAO.businfoExists(businfo.getBusRegNo(), businfo.getBusModel())) {
            return false;
        } else {
            businfoDAO.addBusInfo(businfo);
            return true;
        }

    }

    @Override
    public void updateBusInfo(BusInfo businfo) {
        businfoDAO.updateBusInfo(businfo);
    }

    @Override
    public void deleteBusInfo(int bid) {
        businfoDAO.deleteBusInfo(bid);
    }

}
