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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Naznin34
 */
@Transactional
@Repository
public class BusInfoDAO implements IBusInfoDAO {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public BusInfo getBusInfoById(int busId) {
        return hibernateTemplate.get(BusInfo.class, busId);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<BusInfo> getAllBusInfo() {
        String hql = "FROM BusInfo as b ORDER BY b.busId";
        return (List<BusInfo>) hibernateTemplate.find(hql);
    }

    @Override
    public void addBusInfo(BusInfo businfo) {
        hibernateTemplate.save(businfo);
    }

    @Override
    public void updateBusInfo(BusInfo businfo) {
        BusInfo bus = getBusInfoById(businfo.getBusId());
        bus.setBusNo(businfo.getBusNo());
        bus.setBusRegNo(businfo.getBusRegNo());
        bus.setBusModel(businfo.getBusModel());
        bus.setBusCapacity(businfo.getBusCapacity());
        bus.setPurchaseDate(businfo.getPurchaseDate());
        bus.setInsuranceStatus(businfo.getInsuranceStatus());
        bus.setInsuranceDate(businfo.getInsuranceDate());
        bus.setInsuranceExpiry(businfo.getInsuranceExpiry());
        bus.setBusType(businfo.getBusType());
        bus.setBusPhoto(businfo.getBusPhoto());

        hibernateTemplate.update(bus);
    }

//    public void deleteBusInfo(int busId) {
//        hibernateTemplate.delete(getBusInfoById(busId));
//    }

//    @SuppressWarnings("unchecked")

//    public boolean BusInfoExists( String busRegNo, String busModel) {
//        String hql = "FROM BusInfo as b WHERE b.busRegNo = ? and b.busModel = ?";
//        List<BusInfo> businfo = (List<BusInfo>) hibernateTemplate.find(hql, busRegNo, busModel);
//        return businfo.size() > 0 ? true : false;
//        
//    }
    @Override
    public void deleteBusInfo(int busId) {
        hibernateTemplate.delete(getBusInfoById(busId));
    }

    @SuppressWarnings("unchecked")
    @Override
    public boolean businfoExists(String busRegNo, String busModel) {
        String hql = "FROM BusInfo as b WHERE b.busRegNo = ? and b.busModel = ?";
        List<BusInfo> businfo = (List<BusInfo>) hibernateTemplate.find(hql, busRegNo, busModel);
        return businfo.size() > 0 ? true : false;
    }

}
