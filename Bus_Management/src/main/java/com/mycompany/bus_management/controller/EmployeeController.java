/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.controller;

import com.mycompany.bus_management.domain.EmpCategory;
import com.mycompany.bus_management.domain.Employee;
import com.mycompany.bus_management.service.IEmpCategoryService;
import com.mycompany.bus_management.service.IEmployeeService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.UriComponentsBuilder;

/**
 *
 * @author Naznin34
 */
@Controller
@RequestMapping("/employee")
public class EmployeeController {
      @Autowired
    private IEmployeeService iEmployeeService;
    
    @RequestMapping("/home")
    public String home(){
    return "employee";
    }
     @RequestMapping(value = "/employee/{id}", method = RequestMethod.GET)
    public ResponseEntity<Employee> getEmployeeById(@PathVariable("id") Integer id) {
        Employee employee  = iEmployeeService.getEmployeeById(id);
        return new ResponseEntity<Employee>(employee, HttpStatus.OK);
}
    
     @RequestMapping(value = "/employee", method = RequestMethod.GET)
    public ResponseEntity<List<Employee>> getAllEmployee() {
        List<Employee> list = iEmployeeService.getAllEmployee();
        return new ResponseEntity<List<Employee>>(list, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/employee", method = RequestMethod.POST)
    public ResponseEntity<Void> addEmployee(@RequestBody Employee employee, UriComponentsBuilder builder) {
        boolean flag = iEmployeeService.addEmployee(employee);
        if (flag == false) {
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/employee/{id}").buildAndExpand(employee.getEmpId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/employee/{id}", method = RequestMethod.PUT)
    public ResponseEntity<Employee> updateEmployee(@RequestBody Employee employee) {
       iEmployeeService.updateEmployee(employee);
        return new ResponseEntity<Employee>(employee, HttpStatus.OK);
    }
    @RequestMapping(value = "/employee/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteEmployee(@PathVariable("id") Integer id) {
         iEmployeeService.deleteEmployee(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }
}
    
    
    


