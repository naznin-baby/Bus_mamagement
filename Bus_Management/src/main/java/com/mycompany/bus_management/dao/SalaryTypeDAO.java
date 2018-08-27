/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.dao;

import com.mycompany.bus_management.domain.Route;
import com.mycompany.bus_management.domain.SalaryType;
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
public class SalaryTypeDAO implements ISalaryTypeDAO{
    
    
     @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public List<SalaryType> getAllSalaryType() {
         String hql = "FROM SalaryType as b ORDER BY b.salaryTypeId";
        return (List<SalaryType>) hibernateTemplate.find(hql);
    }

    @Override
    public SalaryType getSalaryTypeById(int salaryTypeId) {
        return hibernateTemplate.get(SalaryType.class, salaryTypeId);
    }

    @Override
    public void addSalaryType(SalaryType stype) {
        hibernateTemplate.save(stype);
    }

    @Override
    public void updateSalaryType(SalaryType stype) {
         SalaryType sa = getSalaryTypeById(stype.getSalaryTypeId());
        sa.setSalaryType(stype.getSalaryType());
        
        
        hibernateTemplate.update(sa);
    }

    @Override
    public void deleteSalaryType(int salaryTypeId) {
         hibernateTemplate.delete(getSalaryTypeById(salaryTypeId));
    }

    @Override
    public boolean SalaryTypeExists(String salaryType) {
        String hql = "FROM SalaryType as b WHERE b.salaryType = ? ";
        List<SalaryType> list = (List<SalaryType>) hibernateTemplate.find(hql, salaryType);
        return list.size() > 0 ? true : false;
    }
    
}
