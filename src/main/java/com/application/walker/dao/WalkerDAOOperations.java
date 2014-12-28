package com.application.walker.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.application.walker.service.User;

public class WalkerDAOOperations {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	protected void userExists(User user){
		
	}
	
	//Update to user information and address table
	@SuppressWarnings("unchecked")
	public void updateUser(User user){
		sessionFactory = WalkerUtil.getSession();
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		
		//
		Criteria crieteria = session.createCriteria(User.class);
		String user_name = user.getUsername();
		crieteria.add(Restrictions.eq("username", user_name));
		//Will return the list
		List<User>  userResult =  crieteria.list();
		//Iterating List
		if(!userResult.isEmpty()){
			if(session.isConnected()){
				for(User userD : userResult){
					System.out.println("First Name :" +userD.getFirstName());
				}
			}
		}
		
	}
}
