/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.service;

import com.mycompany.bus_management.dao.IRouteDAO;
import com.mycompany.bus_management.dao.ISalaryDAO;
import com.mycompany.bus_management.domain.Route;
import com.mycompany.bus_management.domain.Salary;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Naznin34
 */
@Service
public class SalaryService implements ISalaryService{
    
     @Autowired
    private ISalaryDAO iSalaryDAO;

    @Override
    public List<Salary> getAllSalary() {
        return iSalaryDAO.getAllSalary();
    }

    @Override
    public Salary getSalaryById(int salaryId) {
       Salary sa = iSalaryDAO.getSalaryById(salaryId);
        return sa;
    }

    @Override
    public boolean addSalary(Salary sa) {
         if (iSalaryDAO.SalaryExists(sa.getEmpCategory().getECid())) {
            return false;
        } else {
            iSalaryDAO.addSalary(sa);
            return true;
        }
    }

    @Override
    public void updateSalary(Salary sa) {
       
    }

    @Override
    public void deleteSalary(int salaryId) {
        iSalaryDAO.deleteSalary(salaryId);
    }

  
}
