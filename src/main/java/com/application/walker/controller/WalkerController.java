/**
 * 
 */
package com.application.walker.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.application.walker.service.Address;
import com.application.walker.service.User;
import com.application.walker.service.WalkerService;

/**
 * @author amit agarwal
 *
 */
@Controller
@RequestMapping(value = {"/","user","CreateUser","registrationSuccessfull","deleteuser"})
public class WalkerController {
	
	@Autowired
	private WalkerService walkerService;
	
	public WalkerService getWalkerService() {
		return walkerService;
	}

	public void setWalkerService(WalkerService walkerService) {
		this.walkerService = walkerService;
	}

	public WalkerController(){
		
	}
	
	@RequestMapping(params = "submit",method=RequestMethod.POST)
	private ModelAndView registerUser(HttpServletRequest request){
		ModelAndView model = new ModelAndView("registrationSuccessfull");
		
		Address address = new Address();
		
		address.setAddressLine1(request.getParameter("addressLine1"));
		address.setAddressLine2(request.getParameter("addressLine2"));
		address.setAddressLine3(request.getParameter("addressLine3"));
		address.setCity(request.getParameter("city"));
		address.setState(request.getParameter("state"));
		address.setZipcode(Integer.parseInt((request.getParameter("zip"))));
		
		User user = new User();
		user.setAddress(address);
		user.setFirstName(request.getParameter("fname"));
		user.setLastName(request.getParameter("lname"));
		user.setUsername(request.getParameter("uname"));
		user.setEmailAddress(request.getParameter("emailid"));
		user.setDob(request.getParameter("dob"));
		
		getWalkerService().addEmployee(user);
		
		model.setViewName("registrationSuccessfull");
		return model;
	}
	
	@RequestMapping(params = "delete",method=RequestMethod.POST)
	@ResponseBody
	private String deleteuser(@RequestParam("username") String username) throws Exception{
		System.out.println("Username:" +username);
		int result = getWalkerService().deletingUserInformation(username);
			ModelAndView model = new ModelAndView();
			model.setViewName("userinformation");
			model.addObject("result", result);
			
		return "user information is deleted";
	}
	
}
