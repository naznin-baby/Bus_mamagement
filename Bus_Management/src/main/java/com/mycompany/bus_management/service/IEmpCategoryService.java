/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.service;

import com.mycompany.bus_management.domain.EmpCategory;
import java.util.List;

/**
 *
 * @author Naznin34
 */
public interface IEmpCategoryService {
    List<EmpCategory> getAllEmpCategory();
    EmpCategory getEmpCategoryById(int empCatId);
    boolean addEmpCategory(EmpCategory empCategory);
    void updateEmpCategory(EmpCategory empCategory);
    void deleteEmpCategory(int empCatId);
}
