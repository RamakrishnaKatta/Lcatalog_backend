package com.lll.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BindViewController {
	
     @RequestMapping("/login")
	 public String doLogin(){
		 return "login";
	 }

	  @RequestMapping(value="/",method=RequestMethod.GET)
	  public ModelAndView getDefault(){
		  return new ModelAndView("dashboard");
	  }
	  @RequestMapping(value="dashboard",method=RequestMethod.GET)
	  public ModelAndView getDashboard(){
		  return new ModelAndView("dashboard");
	  }
	 
	  @RequestMapping(value="vendors",method=RequestMethod.GET)
	  public ModelAndView getIndex(){
		  return new ModelAndView("vendors");
	  }
	  
	  @RequestMapping(value="users",method=RequestMethod.GET)
	  public ModelAndView getStates(){
		  return new ModelAndView("users");
	  }
	  
	  @RequestMapping(value="articles",method=RequestMethod.GET)
	  public ModelAndView getCities(){
		  return new ModelAndView("articles");
	  }
	  
	  @RequestMapping(value="vendorReqs",method=RequestMethod.GET)
	  public ModelAndView getvendorReqs(){
		  return new ModelAndView("vendorRequests");
	  }
	  
	  @RequestMapping(value="notifications/send",method=RequestMethod.GET)
	  public ModelAndView getNotifications(){
		  return new ModelAndView("sendNotify");
	  }
	  
	  
}
