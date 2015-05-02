package com.application.walker.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.application.walker.dao.WalkerDAOOperations;
import com.application.walker.service.User;
import com.application.walker.service.WalkerService;

@Controller
@RequestMapping(value= {"/" , "dashboard"})
public class LoginController {
	
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
	public ModelAndView login(@RequestParam String username, @RequestParam String lastname){
		ModelAndView model = new ModelAndView("success");
		System.out.println("logged in");
		String message = null;
		User user = getWalkerService().loginUser(username,lastname);
		if(user == null){
			message = "User Record not found";
			model.addObject("messages", message);
			model.setViewName("admin");
		}
		String firstName = user.getFirstName();
		String lastName = user.getLastName();
		int userid = user.getId();
		String userFullName = firstName  + " " + lastName;
		model.addObject("id", userid);
		model.addObject("messages", userFullName);
		model.setViewName("success");
		
		return model;
	}
	
	@RequestMapping(value= "/searchuser/", params = "admin", method = {RequestMethod.POST,RequestMethod.GET})
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
			@RequestParam(required=false) Integer page,@RequestParam(required=false) String logout,
			@RequestParam(required=false) String dob,@RequestParam(required=false) Integer zip,HttpServletResponse response,HttpSession session) 
										throws ServletException, IOException{
		
		ModelAndView modelandview = new ModelAndView();
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
		
		String register = request.getParameter("submit");
		if(register!=null){
			if(register.equalsIgnoreCase("Register")){
				WalkerController walkerController = new WalkerController();
				walkerController.registerUser(request);
				modelandview.setViewName("searchuser");
				return modelandview;
		}
		}
		
		
		Set<User> user =getWalkerService().retireveUserbyUserName(username,lastname,emailid,dob,zip);
		if(logout == null){
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
				
			}		
				modelandview.setViewName("searchuser");
			}
		else {
			String logOutSession = "Logged out";
			logout(session);
			modelandview.addObject("logOutSessions", logOutSession);
			modelandview.setViewName("admin");
			return modelandview;
		}
			 
		
			return modelandview;
		}
	
	@RequestMapping(params = "logout",value="/admin",method = RequestMethod.GET)
	private String logout(HttpSession session){
		session.invalidate();
		System.out.println("Session Invalidated");
		
		return "redirect:/admin.html";
	}
	
	@RequestMapping(value="/retrieveHistory/{id}/",method = {RequestMethod.GET,RequestMethod.POST})
	private ModelAndView retrieveHistory(@PathVariable("id") int id){
		ModelAndView modelandView = new ModelAndView();
		List response = null;
		System.out.println("Acquiring response from Database");
		response = getWalkerService().retrieveUserHistory(id);
		if(response.size() == 0){
			String reason = "No Data Found";
			modelandView.addObject("emptyList", reason);
			modelandView.addObject("id",id);
			modelandView.setViewName("success");
			return modelandView;
		}
		
		modelandView.addObject("history", response);
		modelandView.setViewName("retrieveHistory");
		return modelandView;
	}
}