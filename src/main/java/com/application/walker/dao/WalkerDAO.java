package com.application.walker.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.application.walker.service.Address;
import com.application.walker.service.User;

//this class will handle all the database related functionality

@Repository
@Transactional(propagation=Propagation.NOT_SUPPORTED,rollbackFor = Exception.class,isolation = Isolation.READ_COMMITTED,timeout=3000)
public class WalkerDAO implements IWalkerDAO, Serializable {

	private static final long serialVersionUID = 1L;
	private Session session;
	
	public WalkerDAO(){
		
	}
	
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED,rollbackFor = Exception.class,isolation = Isolation.READ_UNCOMMITTED,timeout=3000)
	public void addUser(User user) {
		
		Address address = user.getAddress();
		SessionFactory sessionFacotry = WalkerUtil.getSession();
		Session session = sessionFacotry.openSession();
		
		Query query = session.createQuery("from User where username = ?");
		System.out.println("Query :" +query);
		User user_exists=(User)query.setString(0,user.getUsername()).uniqueResult();
		
		if(user_exists==null){
			if(session.isConnected()){
			session.save(address);
			user.setAddress(address);
			session.save(user);
					System.out.println("**********");
			}
		}else{
			System.out.println("User already exists, cannot commit");
		}
	}
	@SuppressWarnings("unchecked")
	@Override
		public List<User> retrieveUser(List<String> username, List<String> lastname, List<String> emailid) {
		List<User> user = null;
		List<User> multipleUsers = new ArrayList<User>();
		SessionFactory sessionFactory = WalkerUtil.getSession();
		Session session = sessionFactory.openSession();
		
		if(session.isOpen()){
			if(session.isConnected()){
			if(username == null && lastname==null && emailid ==null){
				List<User> userlist = returnAllUsers();
				return userlist;
			}
				
				if(!(username.isEmpty())){
					for(String user_name :username){
						String userN = user_name.replaceAll(",", "");
						if(!(userN.equals("")  || userN.equalsIgnoreCase(null))){
						Criteria criteria = session.createCriteria(User.class);
						criteria.add(Restrictions.eq("username", user_name));
						user = criteria.list();
						multipleUsers.addAll(user);
						}
					}
				}

				if(!(lastname.isEmpty())){
					for(String last_name : lastname){
						String last = last_name.replaceAll(",", "");
						if(!(last.equals("")  || last.equalsIgnoreCase(null))){
					Criteria criteria = session.createCriteria(User.class);
					criteria.add(Restrictions.eq("lastName", last_name));
					user = criteria.list();
					multipleUsers.addAll(user);
				}
						}
					}
				
				if(!(emailid.isEmpty())){
					for(String email_id :emailid){
						String email = email_id.replaceAll(",", "");
						if(!(email.equals("")  || email.equals(null))){
					Criteria criteria = session.createCriteria(User.class);
					criteria.add(Restrictions.eq("emailAddress", email_id));
					user = criteria.list();
					multipleUsers.addAll(user);
				}
						}
					}
			}
		}
		
		return multipleUsers;
	}

	@Override
	public int deleteUser(String username,User user) throws Exception {
			int result = 0;
			SessionFactory sessionFactory = WalkerUtil.getSession();
			Session session = sessionFactory.openSession();
				
			if(session.isOpen() && session.isConnected()){
				Criteria criteria = session.createCriteria(User.class);
				criteria.add(Restrictions.eq("username", username));
				user = (User) criteria.uniqueResult();
				session.delete(user);
				}
			else{
					throw new Exception("Session cannot be established, please try again later. Thanks for your patience");
				}
		return result;
	}
	
	private List<User> returnAllUsers(){
		List<User> userList = new ArrayList<User>();
//		SessionFactory sessionFactory  = WalkerUtil.getSession();
//		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from User");
		userList = query.list();
		return userList;
	}
	
}	

