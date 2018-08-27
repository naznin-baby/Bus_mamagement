/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.dao;

import com.mycompany.bus_management.domain.Payment;
import com.mycompany.bus_management.domain.RouteCounter;
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
public class RouteCounterDAO implements IRouteCounterDAO{

      @Autowired
    private HibernateTemplate hibernateTemplate;
    
    @Override
    public List<RouteCounter> getAllRouteCounter() {
         String hql = "FROM RouteCounter p LEFT JOIN FETCH  p.route ORDER BY p.counterId";
        return (List<RouteCounter>) hibernateTemplate.find(hql);
    }

    @Override
    public RouteCounter getRouteCounterById(int counterId) {
       return hibernateTemplate.get(RouteCounter.class, counterId);
    }

    @Override
    public void addRouteCounter(RouteCounter routecounter) {
        hibernateTemplate.save(routecounter);
    
    }

    @Override
    public void updateRouteCounter(RouteCounter routecounter) {
        
       RouteCounter rc = getRouteCounterById(routecounter.getCounterId());
        rc.setCounterName(routecounter.getCounterName());
       
        rc.setRoute(routecounter.getRoute());
        rc.setCounterAddress(routecounter.getCounterAddress());
       
        rc.setContactNo(routecounter.getContactNo());
       
       
        hibernateTemplate.update(rc);
    }

    @Override
    public void deleteRouteCounter(int counterId) {
         hibernateTemplate.delete(getRouteCounterById(counterId)); 
    }

    @Override
    public boolean RouteCounterExists(int routeId, String counterAddress) {
          String hql = "FROM RouteCounter as p WHERE p.route.routeId = ? and p.counterAddress=?";
        List<RouteCounter> list = (List<RouteCounter>) hibernateTemplate.find(hql, routeId, counterAddress);
        return list.size() > 0 ? true : false;
    }
    
}
