/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.service;

import com.mycompany.bus_management.dao.IBusInfoDAO;
import com.mycompany.bus_management.dao.IEmpCategoryDAO;
import com.mycompany.bus_management.dao.IEmployeeDAO;
import com.mycompany.bus_management.domain.BusInfo;
import com.mycompany.bus_management.domain.EmpCategory;
import com.mycompany.bus_management.domain.Employee;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Naznin34
 */
@Service
public class EmployeeService implements IEmployeeService{

    
     @Autowired
    private IEmployeeDAO iemployeeDAO;
    @Override
    public List<Employee> getAllEmployee() {
        return iemployeeDAO.getAllEmployee();
    }

    @Override
    public Employee getEmployeeById(int empId) {
        Employee obj = iemployeeDAO.getEmployeeById(empId);
        return obj;
    }

    @Override
    public synchronized boolean addEmployee(Employee employee) {
        
        if (iemployeeDAO.EmployeeExists(employee.getEmpName(), employee.getMoblic())){
            return false;
        } else {
            iemployeeDAO.addEmployee(employee);
            return true;
        }
        
    }

    @Override
    public void updateEmployee(Employee employee) {
        iemployeeDAO.updateEmployee(employee);
    }

    @Override
    public void deleteEmployee(int empId) {
       iemployeeDAO.deleteEmployee( empId);  
    }

   
    
    
}
