package com.application.walker.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.application.walker.exception.WalkerException;
import com.application.walker.service.User;

/**
 * to denote the class as DAO layer class (this class will handle only login functionality)
 * @author Amit Agarwal
 *
 */

@Repository
public class LoginDaoImpl implements iLoginDao  {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public User loginUser(String username, String lastname) {
		
		User user = null;
		
		SessionFactory sessionFactory = WalkerUtil.getSession();
		Session session  = sessionFactory.openSession();
		
		if(session.isConnected()){
				user = (User) session.createCriteria(User.class).add(Restrictions.and(Property.forName("username").eq(username),
															Property.forName("lastName").eq(lastname))).uniqueResult();
		
			if(user == null){
				try {
					throw new WalkerException("User Cannot be found with the given credentials");
				} catch (WalkerException e) {
					e.getMessage();
					e.printStackTrace();
				}
			} 
		
		}
		return user;
		}

}
