package com.application.walker.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;
import com.application.walker.dao.WalkerDAOOperations;
import com.application.walker.service.User;
import com.application.walker.service.WalkerService;

@Controller
@RequestMapping(value= {"/" , "general_user","/walker/"})
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
	
	@RequestMapping(value= "/searchuser/", params = "admin", method = RequestMethod.POST)
	private ModelAndView loginSuccessfull(@RequestParam String username, @RequestParam String lastname, HttpServletRequest request ){
		ModelAndView model = new ModelAndView("searchuser");
		String message = null;
		User user = getWalkerService().loginUser(username,lastname);
		if(user == null){
			message = "User Record not found";
			model.addObject("messages", message);
			model.setViewName("admin");
		}
		String user1 = user.getUsername();
		model.addObject("messages", user1);
		model.setViewName("searchuser");
		
		return model;
	}
	
	@RequestMapping(value= "/userinformation",method= {RequestMethod.POST,RequestMethod.GET})
	private ModelAndView retrieveInformation(@RequestParam(required=false) List<String> username, @RequestParam(required=false) List<String> lastname, @RequestParam(required=false) List<String> emailid, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
	
		ModelAndView modelandview = new ModelAndView();
		List<User> user =getWalkerService().retireveUserbyUserName(username,lastname,emailid);
		
		if(!user.isEmpty()){
				Iterator<User> iterator = user.iterator();
				while(iterator.hasNext()){
					modelandview.addObject("userlist", user);
					iterator.next();
				}
				boolean isPost = "POST".equals(request.getMethod());
				if(isPost){
					modelandview.setViewName("userinformation");
				}else{
					modelandview.addObject("userlist", user);
					modelandview.setViewName("searchuser");
				}
		}else{
			String message = "user does not exists";
			modelandview.addObject("message", message);
			
			
			modelandview.setViewName("searchuser");
		}
		return modelandview;
	}
}