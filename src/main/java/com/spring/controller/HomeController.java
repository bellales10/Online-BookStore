package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	
	//---------  mapping  for home page ----------//
	
	@RequestMapping("/home")
	public String homePage(){
		return "home";
	}
	
	//---------  mapping  for about page ----------//

	@RequestMapping("/about")
	public String aboutUs(){
		return "about";
	}

	//---------  mapping  for login page ----------//

	@RequestMapping("/login")
	public String login(@RequestParam(value="error",required=false) String error,
			            @RequestParam(value="logout",required=false) String logout, Model model){
			if(error!=null)
		model.addAttribute("error","Invalid username and password");
		
		if(logout!=null)
			model.addAttribute("logout","You have logged out successfully");
		return "login";
	}

	@RequestMapping(value="/perform_logout",method=RequestMethod.GET)
	public String showLogout()
	{
	return "login";
	}


}

