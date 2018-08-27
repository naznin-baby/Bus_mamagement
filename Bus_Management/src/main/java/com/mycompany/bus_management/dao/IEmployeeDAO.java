/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.dao;

import com.mycompany.bus_management.domain.Employee;
import java.util.List;

/**
 *
 * @author Naznin34
 */
public interface IEmployeeDAO {
    List<Employee> getAllEmployee();
    Employee getEmployeeById(int empId);
    void addEmployee(Employee employee);
    void updateEmployee(Employee employee);
    void deleteEmployee(int empId);
    boolean EmployeeExists(String empName,String moblic);
}
