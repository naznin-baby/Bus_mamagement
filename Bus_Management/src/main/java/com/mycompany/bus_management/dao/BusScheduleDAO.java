/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.dao;

import com.mycompany.bus_management.domain.BusSchedule;
import java.util.List;
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
public class BusScheduleDAO implements IBusScheduleDAO {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public List<BusSchedule> getAllObject() {
        String hql = "FROM BusSchedule b LEFT JOIN FETCH  b.busInfo LEFT JOIN FETCH  b.route LEFT JOIN FETCH  b.employee ORDER BY b.scheduleId";
        return (List<BusSchedule>) hibernateTemplate.find(hql);
    }

    @Override
    public BusSchedule getObjectById(int id) {
        return hibernateTemplate.get(BusSchedule.class, id);
    }

    @Override
    public void addObject(BusSchedule obj) {
        hibernateTemplate.save(obj);
    }

    @Override
    public void updateObject(BusSchedule obj) {
        BusSchedule b = getObjectById(obj.getScheduleId());
        b.setBusInfo(obj.getBusInfo());
        b.setEmployee(obj.getEmployee());
        b.setRoute(obj.getRoute());
        b.setDateSchdule(obj.getDateSchdule());
        b.setDepartTime(obj.getDepartTime());
        b.setScheduleStart(obj.getScheduleStart());
        b.setDepartPlace(obj.getDepartPlace());
        b.setBookings(obj.getBookings());
        hibernateTemplate.update(b);
    }

    @Override
    public void deleteObject(int id) {
          hibernateTemplate.delete(getObjectById(id));
    }

    @Override
    public boolean objectExists(int busid, String departplace) {
        String hql = "FROM BusSchedule as b WHERE b.busInfo.busId = ? and b.departPlace=?";
        List<BusSchedule> list = (List<BusSchedule>) hibernateTemplate.find(hql, busid, departplace);
        return list.size() > 0 ? true : false;
    }

}
