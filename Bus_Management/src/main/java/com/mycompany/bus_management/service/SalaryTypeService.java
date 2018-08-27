/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.service;

import com.mycompany.bus_management.dao.IRouteDAO;
import com.mycompany.bus_management.dao.ISalaryTypeDAO;
import com.mycompany.bus_management.domain.Route;
import com.mycompany.bus_management.domain.SalaryType;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Naznin34
 */
@Service
public class SalaryTypeService implements ISalaryTypeService{

    @Autowired
    private ISalaryTypeDAO iSalaryTypeDAO;
    
    @Override
    public List<SalaryType> getAllSalaryType() {
       return iSalaryTypeDAO.getAllSalaryType();  
    }

    @Override
    public SalaryType getSalaryTypeById(int salaryTypeId) {
       SalaryType stype = iSalaryTypeDAO.getSalaryTypeById(salaryTypeId);
        return stype;
    }

    @Override
    public boolean addSalaryType(SalaryType stype) {
       if (iSalaryTypeDAO.SalaryTypeExists(stype.getSalaryType())) {
            return false;
        } else {
            iSalaryTypeDAO.addSalaryType(stype);
            return true;
        }
    }

    @Override
    public void updateSalaryType(SalaryType stype) {
         iSalaryTypeDAO.updateSalaryType(stype);
    }

    @Override
    public void deleteSalaryType(int salaryTypeId) {
       iSalaryTypeDAO.deleteSalaryType(salaryTypeId);
    }
    
}
