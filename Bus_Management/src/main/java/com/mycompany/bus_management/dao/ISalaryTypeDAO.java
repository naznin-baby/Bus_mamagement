/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.dao;

import com.mycompany.bus_management.domain.Route;
import com.mycompany.bus_management.domain.SalaryType;
import java.util.List;

/**
 *
 * @author Naznin34
 */
public interface ISalaryTypeDAO {
    List<SalaryType> getAllSalaryType();

   SalaryType getSalaryTypeById(int salaryTypeId );

    void addSalaryType(SalaryType stype);

    void updateSalaryType(SalaryType stype);

    void deleteSalaryType(int salaryTypeId);

    boolean SalaryTypeExists(String salaryType );
}
