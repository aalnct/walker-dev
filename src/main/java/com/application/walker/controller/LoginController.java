package com.application.walker.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.BeanNameAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
//Will handle dispatched request coming from login page
import org.springframework.web.servlet.ModelAndView;

import com.application.walker.dao.WalkerDAOOperations;
import com.application.walker.service.User;
import com.application.walker.service.WalkerService;

@Controller
@RequestMapping(value= {"/" , "general_user","/walker"})
public class LoginController{
	
	@Autowired
	private WalkerDAOOperations walkerDaoOperations;
	
	public WalkerDAOOperations getWalkerDaoOperations() {
		return walkerDaoOperations;
	}

	public void setWalkerDaoOperations(WalkerDAOOperations walkerDaoOperations) {
		this.walkerDaoOperations = walkerDaoOperations;
	}

	@Autowired
	private WalkerService walkerService;
	
	public WalkerService getWalkerService() {
		return walkerService;
	}

	public void setWalkerService(WalkerService walkerService) {
		this.walkerService = walkerService;
	}

	@RequestMapping(params = "login", method = RequestMethod.POST)
	private ModelAndView onSubmit(){
		ModelAndView model = new ModelAndView("success");
		
		return model;
	}
	
	@RequestMapping(value= "/searchuser/{username}/{lastname}", params = "admin", method = RequestMethod.POST)
	private ModelAndView loginSuccessfull(@RequestParam String username, @RequestParam String lastname, HttpServletRequest request ){
		ModelAndView model = new ModelAndView("searchuser");
		User user = getWalkerService().loginUser(username,lastname);
		if(user == null){
			String message = "User Record not found";
			model.addObject("messages", message);
			model.setViewName("admin");
		}
		model.setViewName("searchuser");
		return model;
	}
	
	
	
	
	@SuppressWarnings("rawtypes")
	
//	private ModelAndView retrieveInformation(@RequestParam String username, HttpServletRequest request,
//			HttpServletResponse response) throws ServletException, IOException{
	@RequestMapping(value= "/userinformation",method=RequestMethod.POST)
	private ModelAndView retrieveInformation(@RequestParam String username, @RequestParam String lastname, @RequestParam String emailid, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		ModelAndView modelandview = new ModelAndView();
		User user =getWalkerService().retireveUserbyUserName(username,lastname,emailid);
		if(null!=user){
		modelandview.addObject("user", user);
		modelandview.setViewName("userinformation");
		
		}else{
			String message = "user does not exists";
			modelandview.addObject("message", message);
			modelandview.setViewName("searchuser");
		}
		return modelandview;
	}

	
}