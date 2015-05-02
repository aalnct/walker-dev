package com.application.walker.dao;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;








import java.util.Set;

import org.hibernate.classic.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.Criteria;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;

import static org.mockito.Mockito.*;

import com.application.walker.service.Address;
import com.application.walker.service.Coach;
import com.application.walker.service.User;


@RunWith(MockitoJUnitRunner.class)
public class WalkerDAOTest {
	
	private WalkerDAO walkerDAO;
	
	@Mock
	private SessionFactory sessionFactory;
	@Mock
	private Session session;
	
	@Mock
	private Query query;
	
	@Mock
	private Criteria criteria;
	
	@Before
	public void setUp() throws Exception {
		
		walkerDAO = new WalkerDAO();
		walkerDAO.setSessionFactory(sessionFactory);
		
		when(sessionFactory.openSession()).thenReturn(session);
		when(session.createQuery(anyString())).thenReturn(query);
		when(session.isOpen()).thenReturn(true);
		when(session.isConnected()).thenReturn(true);
		
	}

	@Test
	public void addUserTest() {
		
		User user = new User();
		Address address = new Address();
		Coach coach = new Coach();
		
		
		
		user.setFirstName("Romit");
		user.setLastName("Agarwal");
		user.setEmailAddress("romit@gmail.com");
		user.setUsername("romitagarwal");
		user.setCoach(coach);
		user.setDob("01011990");
		user.setAddress(address);
		
		coach.setCoachEmailId("coach@gmail.com");
		coach.setName("Andrew");
		
		when(query.setString(0, user.getUsername())).thenReturn(query);
		when(query.setString(0, user.getUsername()).uniqueResult()).thenReturn(null);
		
		
		walkerDAO.addUser(user);
		
	}
	@Test
	public void returnUserTest(){
		
		List<User> userList = new ArrayList<User>();
		
		User user = new User();
		Address address = new Address();
		Coach coach = new Coach();
		
		
		Integer zipCode = 30338;
		
		user.setFirstName("Amit");
		user.setLastName("Agarwal");
		user.setEmailAddress("aalnct@gmail.com");
		user.setUsername("aalnct");
		user.setCoach(coach);
		user.setDob("09/22/1986");
		user.setAddress(address);
		address.setZipcode(zipCode);
		
		coach.setCoachEmailId("coach@gmail.com");
		coach.setName("Andrew");
		
		String DOB = "09/22/1986";
		
		
		List<String> username = new ArrayList<String>();
		username.add("aalnct");
		
		List<String> lastName = new ArrayList<String>();
		lastName.add("Agarwal");
		
		List<String> email = new ArrayList<String>();
		email.add("aalnct@gmail.com");
		
		userList.add(user);
		
		when(query.list()).thenReturn(userList);
		
		Set<User> returnNullUserObject = walkerDAO.retrieveUser(null, null, null, null, 0);
		
		assertEquals(userList.size(), returnNullUserObject.size());
		
		User returnUserObject = returnNullUserObject.iterator().next();
		
		assertEquals(userList.get(0).getUsername(), returnUserObject.getUsername());
		assertEquals(userList.get(0).getLastName(), returnUserObject.getLastName());
		assertEquals(userList.get(0).getEmailAddress(), returnUserObject.getEmailAddress());
		assertEquals(userList.get(0).getDob(), returnUserObject.getDob());
		assertEquals(userList.get(0).getAddress().getZipcode(), returnUserObject.getAddress().getZipcode());
		
		when(session.createCriteria(User.class)).thenReturn(criteria);
		when(session.createCriteria(User.class,"user")).thenReturn(criteria);
		when(criteria.list()).thenReturn(userList);
		when(criteria.add(Mockito.any(Criterion.class))).thenReturn(criteria);
		when(criteria.setTimeout(Mockito.any(Integer.class))).thenReturn(criteria);
		
		when(criteria.setLockMode(Mockito.any(LockMode.class))).thenReturn(criteria);
		
		
		Set<User> returnUser = walkerDAO.retrieveUser(username, lastName, email, DOB, zipCode);
		
		//userList.add(user);
		returnUserObject = returnNullUserObject.iterator().next();
		
		assertTrue("No user found with given condition", returnUser.size() == 1);
		
		assertEquals(username.get(0), returnUserObject.getUsername());
		assertEquals(lastName.get(0), returnUserObject.getLastName());
		assertEquals(email.get(0), returnUserObject.getEmailAddress());
		assertEquals(DOB, returnUserObject.getDob());
		
		assertEquals(zipCode, returnUserObject.getAddress().getZipcode());
		
	}

	
}
