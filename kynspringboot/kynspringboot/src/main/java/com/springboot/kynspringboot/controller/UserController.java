package com.springboot.kynspringboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.springboot.kynspringboot.dao.User;

@Controller
public class UserController{
	
	@GetMapping("/login")
    public String loginPage(Model model) {
        model.addAttribute("user",new User());
        return "login";
    }

	@GetMapping("/login_error")
    public String onLoginError(Model model) {
        String error_msg = "Incorrect user or password. Please re-enter.";
        model.addAttribute("error_string", error_msg);
        return "login";
 }
	

}

