/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.dao;

import com.mycompany.bus_management.domain.Employee;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Naznin34
 */
@Transactional
@Repository
public class EmployeeDAO implements IEmployeeDAO{

    
    @Autowired
    private  HibernateTemplate hibernateTemplate;
    
    
    @SuppressWarnings("unchecked")
    @Override
    public List<Employee> getAllEmployee() {
       String hql ="From Employee as em LEFT JOIN FETCH em.empCategory order by em.empId";
       return (List<Employee>)hibernateTemplate.find(hql);
    }

    @Override
    public Employee getEmployeeById(int empId) {
       return hibernateTemplate.get(Employee.class,empId);
    }

    @Override
    public void addEmployee(Employee employee) {
      hibernateTemplate.save(employee);
    }

    @Override
    public void updateEmployee(Employee employee) {
        Employee emp = getEmployeeById(employee.getEmpId());
        emp.setEmpCategory(employee.getEmpCategory());
        emp.setEmpName(employee.getEmpName());
        emp.setGender(employee.getGender());
        emp.setDob(employee.getDob());
        emp.setEmpCategory(employee.getEmpCategory());
        emp.setMoblic(employee.getMoblic());
        emp.setAddress(employee.getAddress());
        emp.setResignedDate(employee.getResignedDate());
        emp.setEmpPhoto(employee.getEmpPhoto());
        
        
        
    }

    @Override
    public void deleteEmployee(int empId) {
        hibernateTemplate.delete(getEmployeeById(empId));
    }
    @SuppressWarnings("unchecked")
    @Override
    public boolean EmployeeExists(String empName, String moblic) {
       String hql ="from Employee as em where em.empName=? and em.moblic=? ";
       List<Employee> employee =(List<Employee>)
               hibernateTemplate.find(hql,empName,moblic);
       return employee.size()>0?true:false;
    }
    
}
