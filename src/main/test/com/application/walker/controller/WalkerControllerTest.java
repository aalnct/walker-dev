package com.application.walker.controller;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.web.servlet.ModelAndView;

import com.application.walker.service.Address;
import com.application.walker.service.Coach;
import com.application.walker.service.User;
import com.application.walker.service.WalkerCalculation;
import com.application.walker.service.WalkerService;

@RunWith(MockitoJUnitRunner.class)
public class WalkerControllerTest {
	
	@Mock
	HttpServletRequest httpServletRequest;
	
	@InjectMocks
	WalkerController walkerController;
	
	@Mock
	WalkerService walkerService;
	
	@Mock
	WalkerCalculation walkerCalculation;
	
	User user = new User();
	Address address = new Address();
	Coach coach =  new Coach();
	com.application.walker.service.health health = new com.application.walker.service.health();

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void registerUserTest() {
		
		Mockito.when(httpServletRequest.getParameter("list_state_india")).thenReturn("list_state_india");
		Mockito.when(httpServletRequest.getParameter("zip")).thenReturn("30338");
		
		ModelAndView model =  walkerController.registerUser(httpServletRequest);
		
		assertEquals("registrationSuccessfull", model.getViewName());
		
	}
	
	@Test
	public void deleteuserTest() throws Exception{
			int id = 0;
			
			String message = walkerController.deleteuser(id, user);

			assertEquals("user information is deleted", message);
	}
	@Test	
	public void calculateBMITest(){
		int age = 11;
		Double height = 180.0;
		float weight = 80;
		Mockito.when(walkerCalculation.bmiCalculation(age, height, weight)).thenReturn(0.24);
		
		String aString = walkerController.calculateBMI(age, height, weight);
		
		assertEquals("0.24",aString);
	}
	@Test
	public void saveBMIUserTest(){
		int id = 0;
		int age = 11;
		Double height = 180D;
		float weight = 80f;
		float bmi = 0.24f;
			
		Mockito.when(walkerService.saveBMIService(health)).thenReturn("user health information is saved");
		
		String message = walkerController.saveBMIUser(httpServletRequest, id, age, height, weight, bmi);
		
		assertEquals("User Information is saved :)",message);
	}
	
	@Test
	public void saveCoachInformationTest(){
		String name = "Andrew";
		String coachEmailId = "andrew@gmail.com";
		String description = "Coach";
		
		Mockito.when(walkerService.saveCoachInformation(name, coachEmailId, description)).thenReturn("Successfully saved information");
		
		String message  = walkerController.saveCoachInformation(name, coachEmailId, description);
		assertEquals("user information is saved", message);
	}
	@Test
	public void getCoachListTest(){
		String coachTest = null;
		List<String> coachList= new ArrayList<String>();
		coachList.add("Andrew");
		Mockito.when(walkerService.getAllCoach()).thenReturn(coachList);
		coachTest = walkerController.getCoachList();
		
		assertEquals(coachList.toString(), coachTest);
	}
	
	@Test
	public void assignCoachtoUserTest(){
		String coachName = "Andrew";
		String coachEmail = "andrew@gmail.com";
		String userEmail = "aalnct@gmail.com";
		String userName = "aalnct";
		
		String response = walkerService.assignCoachtoUser(coachName, coachEmail, userName, userEmail);
		
		assertEquals(response,walkerController.assignCoachtoUser(coachName,coachEmail,userEmail,userName));
	}
	
	@Test
	public void retrieveUserInformationTest(){
		
		Integer id = 5;
		
		Mockito.when(walkerService.retrieveUserInformationForUpdate(id)).thenReturn(user);
		user = walkerService.retrieveUserInformationForUpdate(id);
		
		assertEquals(user.toString(), walkerController.retrieveUserInformation(id));
	}
	
	@Test
	public void saveStudentTest(){
			
	}
}
