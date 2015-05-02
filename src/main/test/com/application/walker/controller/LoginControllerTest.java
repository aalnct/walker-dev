package com.application.walker.controller;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.web.servlet.ModelAndView;

import com.application.walker.service.User;
import com.application.walker.service.WalkerService;

@RunWith(MockitoJUnitRunner.class)
public class LoginControllerTest {
	
	@InjectMocks
	LoginController loginController;
	
	@Mock
	WalkerService walkerService;
	
	User user = new User();

	@Before
	public void setUp() throws Exception {
		
	}

	@Test
	public void loginTest() {
		
		user.setId(2);
		
		user.setFirstName("Amit");
		user.setLastName("Agarwal");
		
		Mockito.when(walkerService.loginUser("aalnct", "agarwal")).thenReturn(user);
		ModelAndView modelandView =  loginController.login("aalnct", "agarwal");
		
		assertEquals("success", modelandView.getViewName());
		assertEquals(user.getId(),modelandView.getModel().get("id"));
		assertEquals(user.getFirstName() + " " +user.getLastName() ,modelandView.getModel().get("messages"));
	}
	
	

}
