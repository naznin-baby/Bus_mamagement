/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.service;

import com.mycompany.bus_management.domain.Route;
import com.mycompany.bus_management.domain.Salary;
import java.util.List;

/**
 *
 * @author Naznin34
 */
public interface ISalaryService {
    List<Salary> getAllSalary();

   Salary getSalaryById(int salaryId);

    boolean addSalary(Salary sa);

    void updateSalary(Salary sa);

    void deleteSalary(int salaryId);
}
