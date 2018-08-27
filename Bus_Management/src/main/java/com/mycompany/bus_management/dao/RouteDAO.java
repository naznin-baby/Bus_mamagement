/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.dao;

import com.mycompany.bus_management.domain.BusSchedule;
import com.mycompany.bus_management.domain.Route;
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
public class RouteDAO implements IRouteDAO{

     @Autowired
    private HibernateTemplate hibernateTemplate;
     
     
    @Override
    public List<Route> getAllRoute() {
         String hql = "FROM Route as b ORDER BY b.routeId";
        return (List<Route>) hibernateTemplate.find(hql); 
    }

    @Override
    public Route getRouteById(int routeId) {
       return hibernateTemplate.get(Route.class, routeId);
    }

    @Override
    public void addRoute(Route route) {
         hibernateTemplate.save(route);
    }

    @Override
    public void updateRoute(Route route) {
       Route r = getRouteById(route.getRouteId());
        r.setRouteNo(route.getRouteNo());
        r.setRouteName(route.getRouteName());
        r.setDepot(route.getDepot());
        r.setDestination(route.getDestination());
        r.setDistance(route.getDistance());
       r.setAcCharge(route.getAcCharge());
        r.setNonAcCharge(route.getNonAcCharge());
        
        hibernateTemplate.update(r);
    }

    @Override
    public void deleteRoute(int routeId) {
      hibernateTemplate.delete(getRouteById(routeId)); 
    }

    @Override
    public boolean RouteExists(String routename, String destination) {
        String hql = "FROM Route as b WHERE b.routeName = ? and b.destination = ?";
        List<Route> list = (List<Route>) hibernateTemplate.find(hql, routename,destination);
        return list.size() > 0 ? true : false;
    }
    
}
