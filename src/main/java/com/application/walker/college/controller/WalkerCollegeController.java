/**
 * 
 */
package com.application.walker.college.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.application.walker.college.service.Faculty;
import com.application.walker.college.service.WalkerCollegeService;

/**
 * @author AmitAgarwal
 *
 */

@Controller
public class WalkerCollegeController {
	
	
	@Autowired
	private WalkerCollegeService collegeService;
	
	
	public void setCollegeService(WalkerCollegeService collegeService){
		this.collegeService = collegeService;
	}
	
	public WalkerCollegeService getCollegeService(){
		return collegeService;
	}
	
		
	@RequestMapping(value = "/college", method = RequestMethod.POST)
	@ResponseBody
	private String saveFacultyDetails(@ModelAttribute("faculty")Faculty faculty){
		ModelAndView model = new ModelAndView();
		model.setViewName("college");
		return "college";
	}
	
	@RequestMapping(value = "/searchresult",method=RequestMethod.POST)
	public ModelAndView saveFacultyDetails(@RequestParam("search") String search){
		
		getCollegeService().searchFacultyDetails(search);;
		
		ModelAndView model = new ModelAndView();
		model.setViewName("searchresult");
		return model;
	}
	
	@RequestMapping(value="/saveFacultyData",method=RequestMethod.POST)
	public ModelAndView saveFacultyData(@ModelAttribute("faculty") Faculty faculty){
		getCollegeService().saveFacultData(faculty);;
		return new ModelAndView();
	}
	
}
