package com.application.walker.service;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.application.walker.dao.IWalkerDAO;
import com.application.walker.dao.WalkerDAO;

@RunWith(MockitoJUnitRunner.class)
public class WalkerServiceTest {

	WalkerService service = null;
	
	@Mock
	IWalkerDAO walkerDAO;
	
	User user = new User();
	Address address = new Address();
	health health = new health();
	
	@Before
	public void setUp() throws Exception {
			
		service = new WalkerService();
		service.setiWalkerDAO(walkerDAO);
	
	}

	@Test
	public void test() {
		
	}
	
	@Test(expected =Exception.class)
	
	public void addEmployee_InvalidCityTest() throws Exception{
		
		user.setFirstName("Romit");
		user.setLastName("Agarwal");
		user.setEmailAddress("romit@gmail.com");
		user.setUsername("romitagarwal");
		user.setDob("01011990");
		user.setAddress(address);
		address.setCity("Chicago");
		
		
		Mockito.doNothing().when(walkerDAO).addUser(user);
		service.addEmployee(user);
		
	}
	
	@Test
	public void addEmployee_validCityTest() throws Exception{
		
		user.setFirstName("Romit");
		user.setLastName("Agarwal");
		user.setEmailAddress("romit@gmail.com");
		user.setUsername("romitagarwal");
		user.setDob("01011990");
		user.setAddress(address);
		address.setCity("NewYork");
		
		
		Mockito.doNothing().when(walkerDAO).addUser(user);
		service.addEmployee(user);
		
	}
	
	@Test
	public void retireveUserbyUserNameTest(){
		List<String> username = new ArrayList<String>();
		List<String> lastname = new ArrayList<String>();
		List<String> emailid = new ArrayList<String>();
		String dob = "09/22/1986";
		
		Integer zip = 30338;
		
		user.setAddress(address);
		user.getAddress().setZipcode(zip);
		
		username.add("aalnct");
		lastname.add("Agarwal");
		emailid.add("aalnct@gmail.com");
		
		
		Set<User> userSet = new HashSet<User>();
		userSet.add(user);
		Mockito.when(walkerDAO.retrieveUser(username,lastname,emailid,dob,zip)).thenReturn(userSet);
		Set<User> useri = service.retireveUserbyUserName(username, lastname, emailid, dob, zip);
		
		assertEquals(useri.size(),userSet.size());
	
		User user1 = useri.iterator().next();
		
		assertEquals(user.getUsername(),user1.getUsername());
		assertEquals(user.getFirstName(),user1.getFirstName());
		assertEquals(user.getEmailAddress(),user1.getEmailAddress());
		
	}
	
	@Test
	public void saveBMIServiceTest(){
		int id = 0;
		int age = 11;
		Double height = 180D;
		float weight = 80f;
		float bmi = 0.24f;
		
		health.setAge(age);
		health.setHeight(height);
		health.setWeight(weight);
		
		
		Mockito.when(walkerDAO.saveBMIiDAO(health)).thenReturn("user health information is saved");
		String message = service.saveBMIService(health);
		assertEquals("user health information is saved",message);
		
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Test
	public void retrieveUserHistoryTest(){
		int id = 2;
		health.setHealth_id(id);
		
		List response =  new ArrayList();
		response.add(health);
		Mockito.when(walkerDAO.retrieveUserHealthHistory(id)).thenReturn(response);
		List list = service.retrieveUserHistory(id);
		assertEquals(list.size(),response.size());
		assertEquals(list.get(0).toString(),response.get(0).toString());
	}
	@Test
	public void saveCoachInformationTest(){
		String name = "Andrew";
		String coachEmailId = "andrw@gmail.com";
		String description = "He is a good coach";
		
		Mockito.when(walkerDAO.saveCoachData(name, coachEmailId, description)).thenReturn("Successfully saved information");
		String message = service.saveCoachInformation(name, coachEmailId, description);
		
		assertEquals("Successfully saved information",message);
		
	}
	
	

}
