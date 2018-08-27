/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.service;

import com.mycompany.bus_management.domain.Route;
import com.mycompany.bus_management.domain.SalaryType;
import java.util.List;

/**
 *
 * @author Naznin34
 */
public interface ISalaryTypeService {
    List<SalaryType> getAllSalaryType();

   SalaryType getSalaryTypeById(int salaryTypeId);

    boolean addSalaryType(SalaryType stype);

    void updateSalaryType(SalaryType stype);

    void deleteSalaryType(int salaryTypeId);
}
