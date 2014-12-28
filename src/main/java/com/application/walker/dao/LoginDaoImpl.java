package com.application.walker.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.application.walker.service.User;

/**
 * to denote the class as DAO layer class (this class will handle only login functionallity
 * @author amitagarwal
 *
 */
@Repository
public class LoginDaoImpl implements iLoginDao {
	
	private StringBuilder builder  = new StringBuilder();
	
	@SuppressWarnings("unchecked")
	@Override
	public User loginUser(String username, String lastname) {
		
		User user = null;
		
		SessionFactory sessionFactory = WalkerUtil.getSession();
		Session session  = sessionFactory.openSession();
		
		if(session.isConnected()){
				user = (User) session.createCriteria(User.class).add(Restrictions.and(Property.forName("username").eq(username),
															Property.forName("lastName").eq(lastname))).uniqueResult();
		
			if(user ==null){
				throw new NullPointerException("User not found");
			}
		
		}
		return user;
		}

}
