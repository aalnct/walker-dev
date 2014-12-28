package com.application.walker.dao;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.application.walker.service.Address;
import com.application.walker.service.User;

//this class will handle all the database related functionality

@Repository
public class WalkerDAO implements IWalkerDAO {
	
	public WalkerDAO(){
		
	}
	
	@Override
	public void addUser(User user) {
		
		Address address = user.getAddress();
		Transaction tx = null;
		
		SessionFactory sessionFacotry = WalkerUtil.getSession();
		Session session = sessionFacotry.openSession();
		tx = (Transaction) session.beginTransaction();
		
		Query query = session.createQuery("from User where username = ?");
		System.out.println("Query :" +query);
		User user_exists=(User)query.setString(0,user.getUsername()).uniqueResult();
		
		if(user_exists==null){
			if(session.isConnected()){
			session.save(address);
			user.setAddress(address);
			session.save(user);
			
			try {
				tx.commit();
			} 
			catch (HibernateException e) {
					if(tx!=null){
						tx.rollback();
				}
			}finally{
					session.close();
			}
					System.out.println("**********");
			}
		}
		else{
				System.out.println("User already exists :" +user.getUsername()  +"Name:" +user.getFirstName());
		}
	}
	
	@Override
	public User retrieveUser(String username, String lastname, String emailid) {
		User user = null;
		SessionFactory sessionFactory = WalkerUtil.getSession();
		Session session = sessionFactory.openSession();
		
		if(session.isOpen()){
			if(session.isConnected()){
				
				if(! (username.equalsIgnoreCase(null) || username.equalsIgnoreCase(""))){
				Criteria criteria = session.createCriteria(User.class);
				criteria.add(Restrictions.eq("username", username));
				user = (User) criteria.uniqueResult();
				}
				
				if(! (lastname.equalsIgnoreCase(null) || lastname.equalsIgnoreCase(""))){
					Criteria criteria = session.createCriteria(User.class);
					criteria.add(Restrictions.eq("lastName", lastname));
					user = (User) criteria.uniqueResult();
				}
				
				if(! (emailid.equalsIgnoreCase(null) || emailid.equalsIgnoreCase(""))){
					Criteria criteria = session.createCriteria(User.class);
					criteria.add(Restrictions.eq("emailAddress", emailid));
					user = (User) criteria.uniqueResult();
				}
			}
		}
		
		return user;
	}

	@Override
	public int deleteUser(String username) throws Exception {
		int result = 0;
			SessionFactory sessionFactory = WalkerUtil.getSession();
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();
				if(session.isOpen() && session.isConnected()){
					Query query = session.createQuery("delete from User where username = :username");
					query.setParameter("username", username);
					 result = query.executeUpdate();
					if(result > 0){
						System.out.println("Entity Removed");
					}
					
					try{
						transaction.commit();
					}
					catch (HibernateException e) {
						
						if(transaction!=null){
							transaction.rollback();
					}
				}
					finally{
						session.close();
				}
				}else{
					throw new Exception("Session cannot be establisher, please try again later. Thanks for your patience");
				}
		return result;
	}
}	

