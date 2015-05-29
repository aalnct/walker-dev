package com.application.walker.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
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
	
	
	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public User loginUser(String username, String lastname) {
		
		User user = new User();
		
		//SessionFactory sessionFactory = WalkerUtil.getSession();
		
		Session session  = getSessionFactory().openSession();
		
		user.setUsername(username);
		user.setLastName(lastname);
		
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
