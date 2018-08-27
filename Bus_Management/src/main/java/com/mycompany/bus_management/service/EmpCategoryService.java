/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.service;

import com.mycompany.bus_management.dao.IEmpCategoryDAO;
import com.mycompany.bus_management.domain.EmpCategory;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Naznin34
 */
@Service
public class EmpCategoryService implements IEmpCategoryService{

     @Autowired
     private IEmpCategoryDAO iEmpCategoryDAO;
    @Override
    public List<EmpCategory> getAllEmpCategory() {
        return iEmpCategoryDAO.getAllEmpCategory();
    }

    @Override
    public EmpCategory getEmpCategoryById(int empCatId) {
        EmpCategory obj = iEmpCategoryDAO.getEmpCategoryById(empCatId);
        return obj;
    }

    @Override
    public synchronized boolean addEmpCategory(EmpCategory empCategory) {
        iEmpCategoryDAO.addEmpCategory(empCategory);
        if(iEmpCategoryDAO.EmpCategoryExists(empCategory.getECid(),empCategory.getEmpCatName())){
        return false;
        }
        
        else{ iEmpCategoryDAO.addEmpCategory(empCategory);
        return true;
        
        }
        
    }

    @Override
    public void updateEmpCategory(EmpCategory empCategory) {
        iEmpCategoryDAO.updateEmpCategory(empCategory);
    }

    @Override
    public void deleteEmpCategory(int empCatId) {
        iEmpCategoryDAO.deleteEmpCategory(empCatId);
    }
    
}
