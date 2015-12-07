/**
 * 
 */
package com.application.walker.controller;

import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.application.walker.service.AddressVO;
import com.application.walker.service.AdminVO;
import com.application.walker.service.CustomerVO;
import com.application.walker.service.IWalkerStudentService;

/**
 * @author AmitAgarwal
 *
 */
@Controller
public class HondaController {
	
	Logger logger = Logger.getLogger(HondaController.class);
	
	@Autowired
	private IWalkerStudentService iwalkerStudentService;
	
	
	
	//Employee Details will be fetched
	
	public IWalkerStudentService getWalkerStudentService() {
		return iwalkerStudentService;
	}

	public void setWalkerStudentService(IWalkerStudentService walkerStudentService) {
		this.iwalkerStudentService = walkerStudentService;
	}

	@RequestMapping(value = "/saveEmployeeDetails/",method = RequestMethod.POST)
	public void fetchEmployeeDetail(@RequestParam List employeeList){
		System.out.println("Fetch Employee Details");
	}
	
	@RequestMapping(value = "/createAdminProfile", method = RequestMethod.POST)
	public String createAdminProfile(@ModelAttribute("customerVO") CustomerVO customerVO){
		//Create Admin profile credentials
		String methodName = "createAdminProfile";
		logger.debug(methodName);
//		Iterator<AddressVO> address = customerVO.getAddress().iterator();
//		
//		while(address.hasNext()){
//			System.out.println(address.next().getAddressLine1());
//		}
		
		getWalkerStudentService().saveAdminCredentials(customerVO);
		
		return "user profile created";
	}
	
	//Login Method for Honda Admin
	@RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
	public void adminLogin(@ModelAttribute AdminVO admin){
		//call to Service
		
		
	}
	
	

}
