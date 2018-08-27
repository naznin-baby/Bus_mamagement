/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.dao;

import com.mycompany.bus_management.domain.Route;
import com.mycompany.bus_management.domain.Salary;
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
public class SalaryDAO implements ISalaryDAO{

    
    @Autowired
    private HibernateTemplate hibernateTemplate;
    
    @Override
    public List<Salary> getAllSalary() {
       String hql = "FROM Salary b LEFT JOIN FETCH  b.empCategory LEFT JOIN FETCH  b.employee LEFT JOIN FETCH  b.salaryType ORDER BY b.salaryId";
        return (List<Salary>) hibernateTemplate.find(hql); 
    }

    @Override
    public Salary getSalaryById(int salaryId) {
        return hibernateTemplate.get(Salary.class, salaryId);
    }

    @Override
    public void addSalary(Salary sa) {
       hibernateTemplate.save(sa);
    }

    @Override
    public void updateSalary(Salary sa) {
        Salary s = getSalaryById(sa.getSalaryId());
        s.setEmpCategory(sa.getEmpCategory());
        s.setEmployee(sa.getEmployee());
        s.setSalaryType(sa.getSalaryType());
        s.setBasic(sa.getBasic());
       s.setNoOfTrip(sa.getNoOfTrip());
       s.setFestivalFee(sa.getFestivalFee());
        s.setInsuranceFee(sa.getInsuranceFee());
         s.setTotalSalary(sa.getTotalSalary());
        
        hibernateTemplate.update(s);
    }

    @Override
    public void deleteSalary(int salaryId) {
        hibernateTemplate.delete(getSalaryById(salaryId)); 
    }

    @Override
    public boolean SalaryExists(String ecid) {
        String hql = "FROM Salary as b WHERE b.empCategory.ECid = ? ";
        List<Route> list = (List<Route>) hibernateTemplate.find(hql, ecid);
        return list.size() > 0 ? true : false;
    }
    
}
