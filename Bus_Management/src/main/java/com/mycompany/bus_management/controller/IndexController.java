/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Naznin34
 */
@Controller
public class IndexController {

    @RequestMapping("/")
    public String welcome() {//Welcome page, non-rest
        //        return "Welcome to RestTemplate Example.";
        return "home";
    }
}
