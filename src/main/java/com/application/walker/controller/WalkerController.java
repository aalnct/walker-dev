/**
 * 
 */
package com.application.walker.controller;



import java.io.Serializable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.application.walker.service.Address;
import com.application.walker.service.IWalkerStudentService;
import com.application.walker.service.Student;
import com.application.walker.service.User;
import com.application.walker.service.WalkerCalculation;
import com.application.walker.service.WalkerService;
import com.application.walker.service.health;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * @author amit agarwal
 *
 */
@Controller
@RequestMapping(value = {"/","user","CreateUser","registrationSuccessfull","deleteuser/*","/walker"})
public class WalkerController implements Serializable{
	
	/**
	 * 
	 */
	
	
	
	private static final long serialVersionUID = 1L;
	@Autowired
	private WalkerService walkerService;
	@Autowired
	private WalkerCalculation walkerCalculation;
	
	@Autowired
	private IWalkerStudentService iStudentService;
	
	public WalkerCalculation getWalkerCalculation() {
		return walkerCalculation;
	}

	public WalkerService getWalkerService() {
		return walkerService;
	}

	public void setWalkerService(WalkerService walkerService) {
		this.walkerService = walkerService;
	}

	public WalkerController(){
		
	}
	
	//handles mapping from landing page to  welcome page
	 @RequestMapping(value="/home", method =RequestMethod.GET)
	    public ModelAndView displayHomePageEvent(HttpServletRequest request, HttpServletResponse response) {
		 ModelAndView modelandview = new ModelAndView();
		 modelandview.setViewName("welcomeuser");
		  return modelandview;

	}
	
	@RequestMapping(params = "submit",method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView registerUser(HttpServletRequest request){
		ModelAndView model = new ModelAndView("registrationSuccessfull");
		
		Address address = new Address();
		
		address.setAddressLine1(request.getParameter("addressLine1"));
		address.setAddressLine2(request.getParameter("addressLine2"));
		address.setAddressLine3(request.getParameter("addressLine3"));
		address.setCity(request.getParameter("city"));
		
		if(request.getParameter("state")!=null){
			address.setState(request.getParameter("state"));	
		}
		else{
			String state_india =request.getParameter("list_state_india");
			if(!state_india.equalsIgnoreCase("state")){
				address.setState(state_india);
			}else{
				String state_usa = request.getParameter("list_state_usa");
				address.setState(state_usa);
			}
		}
		
		address.setZipcode(Integer.parseInt((request.getParameter("zip"))));
		
		User user = new User();
		user.setAddress(address);
		user.setFirstName(request.getParameter("fname"));
		user.setLastName(request.getParameter("lname"));
		user.setUsername(request.getParameter("uname"));
		user.setEmailAddress(request.getParameter("emailid"));
		user.setDob(request.getParameter("dob"));
		
		if(walkerService == null){
			walkerService = new WalkerService();
		}
		
		try {
			getWalkerService().addEmployee(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.setViewName("registrationSuccessfull");
		return model;
	}

	@RequestMapping(value = "/deleteuser/{id}", method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public String deleteuser(@PathVariable("id") int id,User user) throws Exception{
		
		getWalkerService().deletingUserInformation(id,user);
			
			ModelAndView model = new ModelAndView();
			model.setViewName("deleteuser"); 

		return "user information is deleted";
	}
	
	@ResponseBody
	@RequestMapping(value = "/calculateBMI/",method={RequestMethod.GET,RequestMethod.POST})
	public String calculateBMI(@RequestParam int age,@RequestParam Double height,@RequestParam float weight){
		//passing the request to service
		Double result = getWalkerCalculation().bmiCalculation(age, height, weight);
		ModelAndView modelandview = new ModelAndView();
		String aString = Double.toString(result);
		modelandview.addObject("result", result);
		System.out.println(result);
		modelandview.setViewName("success");
		return aString;
	}
	
	@ResponseBody
	@RequestMapping(value="/savebmi/",method={RequestMethod.GET,RequestMethod.POST})
	public String saveBMIUser(HttpServletRequest request, @RequestParam Integer id,@RequestParam int age,
			@RequestParam Double height, @RequestParam float weight,@RequestParam float bmi){
		health h = new health();
		
		h.setUserId(id);
		h.setAge(age);
		h.setHeight(height);
		h.setWeight(weight);
		h.setBmi(bmi);
		
		String SuccessfullMessage = getWalkerService().saveBMIService(h);
		ModelAndView model= new ModelAndView();
		model.addObject("Successfull", SuccessfullMessage);
		model.setViewName("success");
		return "User Information is saved :)";
	}
	
	@ResponseBody
	@RequestMapping(value="/saveCoach/", method = RequestMethod.POST)
	public String saveCoachInformation(@RequestParam String name, @RequestParam String coachEmailId, @RequestParam String description){
		//Calling service
		getWalkerService().saveCoachInformation(name, coachEmailId,description);
		System.out.println("Saving coach information");
		String Message = "user information is saved";
		return Message;
	}
	
	@ResponseBody
	@RequestMapping(value="/coachlist/")
	public String getCoachList(){
		System.out.println("Getting list of all coaches");
		List<String> coachList = getWalkerService().getAllCoach();
		return coachList.toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/assignCoach",method = RequestMethod.POST)
	public String assignCoachtoUser(@RequestParam String coachName,@RequestParam String coachEmail,@RequestParam String
			userName, @RequestParam String useremail){
		
		System.out.println("Assign coach to user");
		
		String response = getWalkerService().assignCoachtoUser(coachName, coachEmail, userName, useremail);
		
		return response;
	}
	
	
//	StringBuilder strBuilder = new  StringBuilder();
//	strBuilder.append(" 'firstName': '" + user.getFirstName() + "' ,'lastName': '" +   user.getLastName() + " ' ");
//JSONObject.fromObject(user).toString()
//return strBuilder.toString();
	
	@ResponseBody
	@RequestMapping(value = "/updateUserInformation/", method = RequestMethod.GET)
	public String retrieveUserInformation(@RequestParam Integer id){
		User user=getWalkerService().retrieveUserInformationForUpdate(id);
		ModelAndView model = new ModelAndView();
		model.addObject("users", user);
		model.setViewName("success");
		
		GsonBuilder gSonBuilder = new GsonBuilder();
		//Gson gson = gSonBuilder.registerTypeAdapter(User.class,new User());
		Gson gson  = new Gson();
		gson.toJson(user);
		return gson.toJson(user).toString();
	}
	
	@RequestMapping(value="/details" ,method=RequestMethod.POST)
	public ModelAndView saveStudent(@ModelAttribute("student") Student student){
		student = iStudentService.saveStudentDetails(student);
		
		ModelAndView model = new ModelAndView();
		
		if(student != null){
			model.setViewName("student");
			return model;
		}
		
		else{
			student = new Student();
			Integer identifier = student.getIdentifier();
			model.addObject(identifier.toString(),student.getName());
			model.setViewName("student");
			return model;
		}
	}
	
	@RequestMapping(value="/updateprofile" ,method=RequestMethod.POST)
	public ModelAndView updateProfile(@ModelAttribute("user") User user,Address address){
		getWalkerService().updateUserProfile(user,address);
		ModelAndView model = new ModelAndView();
		model.setViewName("success");
		return model;
		
	}
}


