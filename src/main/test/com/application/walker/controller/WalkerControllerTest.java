package com.application.walker.controller;

import static org.junit.Assert.*;

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
import com.application.walker.service.User;
import com.application.walker.service.WalkerService;

@RunWith(MockitoJUnitRunner.class)
public class WalkerControllerTest {
	
	@Mock
	HttpServletRequest httpServletRequest;
	
	@InjectMocks
	WalkerController walkerController;
	
	@Mock
	WalkerService walkerService;
	
	User user = new User();
	Address address = new Address();

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void registerUserTest() {
		
		String list_state_india = "Georgia";
		
		ModelAndView model =  walkerController.registerUser(httpServletRequest);
		
		Mockito.when(httpServletRequest.getParameter("list_state_india")).thenReturn(list_state_india);
		assertEquals("registrationSuccessfull", model.getViewName());
		
	}

}
