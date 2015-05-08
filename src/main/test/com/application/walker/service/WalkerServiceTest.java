package com.application.walker.service;

import static org.junit.Assert.*;

import java.util.HashSet;
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
		List<String> username = null;
		List<String> lastname = null;
		List<String> emailid = null;
		String dob = "09/22/1986";
		
		Integer zip = 3038;
		user.setUsername("aalnct");
		user.setLastName("Agarwal");
		user.setEmailAddress("aalnct@gmail.com");
		user.setDob(dob);
		user.setAddress(address);
		user.getAddress().setZipcode(zip);
		
		Set<User> userSet = new HashSet<User>();
		
		Mockito.when(walkerDAO.retrieveUser(username,lastname,emailid,dob,zip)).thenReturn(userSet);
	}

}
