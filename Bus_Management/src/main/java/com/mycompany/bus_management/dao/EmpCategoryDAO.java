/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.dao;

import com.mycompany.bus_management.domain.BusInfo;
import com.mycompany.bus_management.domain.EmpCategory;
import java.util.List;
import org.hibernate.LockMode;
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
public class EmpCategoryDAO implements IEmpCategoryDAO {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @SuppressWarnings("unchecked")
    @Override
    public List<EmpCategory> getAllEmpCategory() {
        String hql = "FROM EmpCategory as e ORDER BY e.empCatId";
        return (List<EmpCategory>) hibernateTemplate.find(hql);
    }

    @Override
    public EmpCategory getEmpCategoryById(int empCatId) {
        return hibernateTemplate.get(EmpCategory.class, empCatId);
    }

    @Override
    public void addEmpCategory(EmpCategory empCategory) {
        hibernateTemplate.save(empCategory);
    }

    @Override
    public void updateEmpCategory(EmpCategory empCategory) {
        EmpCategory emp = getEmpCategoryById(empCategory.getEmpCatId());
        emp.setEmpCatName(empCategory.getEmpCatName());

        hibernateTemplate.update(emp);
    }

    @Override
    public void deleteEmpCategory(int empCatId) {
        hibernateTemplate.delete(getEmpCategoryById(empCatId));
    }

    @SuppressWarnings("unchecked")
    @Override
    public boolean EmpCategoryExists(String ECid, String empCatName) {
       String hql = "FROM EmpCategory as e Where e.ECid=? and e.empCatName=?";
       List<EmpCategory> empCategory = (List<EmpCategory>)hibernateTemplate.find(hql,ECid,empCatName);
       return empCategory.size()>0? true:false;
    }

}
