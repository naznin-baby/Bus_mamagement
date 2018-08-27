/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.controller;

import com.mycompany.bus_management.domain.BusInfo;
import com.mycompany.bus_management.domain.EmpCategory;
import com.mycompany.bus_management.service.IEmpCategoryService;
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
@RequestMapping("/empcategory")
public class EmpCategoryController {
    
    @Autowired
    private IEmpCategoryService iEmpCategoryService;
    
    @RequestMapping("/home")
    public String home(){
    return "empcategory";
    }
    
      @RequestMapping(value = "/empcategory/{id}", method = RequestMethod.GET)
    public ResponseEntity<EmpCategory> getEmpCategoryById(@PathVariable("id") Integer id) {
        EmpCategory empCategory = iEmpCategoryService.getEmpCategoryById(id);
        return new ResponseEntity<EmpCategory>(empCategory, HttpStatus.OK);
        
}
    @RequestMapping(value = "/empcategory", method = RequestMethod.GET)
    public ResponseEntity<List<EmpCategory>> getAllEmpCategory() {
        List<EmpCategory> list = iEmpCategoryService.getAllEmpCategory();
        return new ResponseEntity<List<EmpCategory>>(list, HttpStatus.OK);
    }
     @RequestMapping(value = "/empcategory", method = RequestMethod.POST)
    public ResponseEntity<Void> addEmpCategory(@RequestBody EmpCategory empCategory, UriComponentsBuilder builder) {
        boolean flag = iEmpCategoryService.addEmpCategory(empCategory);
        if (flag == false) {
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/empcategory/{id}").buildAndExpand(empCategory.getEmpCatId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
    
     @RequestMapping(value = "/empcategory/{id}", method = RequestMethod.PUT)
    public ResponseEntity<EmpCategory> updateEmpCategory(@RequestBody EmpCategory empCategory) {
       iEmpCategoryService.updateEmpCategory(empCategory);
        return new ResponseEntity<EmpCategory>(empCategory, HttpStatus.OK);
    }
    @RequestMapping(value = "/empcategory/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Void> deleteEmpCategory(@PathVariable("id") Integer id) {
         iEmpCategoryService.deleteEmpCategory(id);
        return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
    }
}

