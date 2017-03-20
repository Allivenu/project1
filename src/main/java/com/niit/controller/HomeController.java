package com.niit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
  public HomeController(){
	  System.out.println("I am running");
  }
  @RequestMapping("/home")
  public String home(){
	  return "home";
  }
  @RequestMapping("/aboutus")
  public String aboutus(){
	  return "aboutus";
  }
  @RequestMapping("/login")
  public String login(@RequestParam(value="error",required=false) String error,Model model,@RequestParam(name="logout",required=false) String logout){
	  if(error!=null)
		  model.addAttribute("error","Invalid Username and Password..");
	  if(logout!=null)
		  model.addAttribute("logout","logged out sucessfully");
	  return "login";
  }
}
