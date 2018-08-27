/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.dao;

import com.mycompany.bus_management.domain.SaleAccount;

import java.util.List;

/**
 *
 * @author Naznin34
 */
public interface ISealAccountDAO {
    List<SaleAccount> getAllObject();

    SaleAccount getObjectById(int id);

    void addObject(SaleAccount obj);

    void updateObject(SaleAccount obj);

    void deleteObject(int id);

    boolean objectExists(String busModel);
}
