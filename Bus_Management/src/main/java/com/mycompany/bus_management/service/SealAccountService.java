/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.service;

import com.mycompany.bus_management.dao.ISealAccountDAO;
import com.mycompany.bus_management.domain.SaleAccount;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Naznin34
 */
@Service
public class SealAccountService implements ISealAccountService{
    
    
    @Autowired
    private ISealAccountDAO iSealAccountDAO;

    @Override
    public List<SaleAccount> getAllObject() {
      
         return iSealAccountDAO.getAllObject();
    }

    @Override
    public SaleAccount getObjectById(int id) {
         SaleAccount obj = iSealAccountDAO.getObjectById(id);
        return obj;
    }

    @Override
    public boolean addObject(SaleAccount obj) {
       if ( iSealAccountDAO.objectExists(obj.getBusInfo().getBusModel())) {
            return false;
        } else {
            iSealAccountDAO.addObject(obj);
            return true;
        }
    }

    @Override
    public void updateObject(SaleAccount obj) {
       iSealAccountDAO.updateObject(obj);
    }

    @Override
    public void deleteObject(int id) {
       iSealAccountDAO.deleteObject(id);
    }
}
