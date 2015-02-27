package com.application.walker.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.application.walker.service.Address;
import com.application.walker.service.Coach;
import com.application.walker.service.User;
import com.application.walker.service.health;

//this class will handle all the database related functionality

@Repository

public class WalkerDAO implements IWalkerDAO, Serializable {

	private static final long serialVersionUID = 1L;
	
	private Session session;
	
	@Autowired
	@Resource(name = "sessionFactory")
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public WalkerDAO(){
		
	}
	
	@Override
	@Transactional
	public void addUser(User user) {
		
		Address address = user.getAddress();
		//SessionFactory sessionFacotry = WalkerUtil.getSession();
		session = sessionFactory.openSession();
		
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
		public List<User> retrieveUser(List<String> username, List<String> lastname, List<String> emailid,String dob,Integer zip) {
		List<User> user = null;
		List<User> multipleUsers = new ArrayList<User>();
		//SessionFactory sessionFactory = WalkerUtil.getSession();
		session = sessionFactory.openSession();
		
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
						criteria.add(Restrictions.eq("username", user_name)).setTimeout(5000);
						criteria.setLockMode(LockMode.READ);
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
					criteria.add(Restrictions.eq("lastName", last_name)).setTimeout(5000);
					criteria.setLockMode(LockMode.READ);
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
					criteria.add(Restrictions.eq("emailAddress", email_id)).setTimeout(5000).setLockMode(LockMode.READ);
					user = criteria.list();
					multipleUsers.addAll(user);
				}
						}
					}
				if(dob!=null){
				if(!(dob.equals(null) || dob.equals(""))){
						Criteria criteria = session.createCriteria(User.class);
						criteria.add(Restrictions.eq("dob", dob)).setTimeout(5000);
						criteria.setLockMode(LockMode.READ);
						user = criteria.list();
						multipleUsers.addAll(user);
						}
				}
				if(zip!=null){
				if(!(zip.equals(null) || zip.equals(""))){
					Criteria criteria = session.createCriteria(User.class,"user");
					criteria.createAlias("user.address", "address");
					criteria.add(Restrictions.eq("address.zipcode", zip)).setTimeout(5000);
					criteria.setLockMode(LockMode.READ);
					user = criteria.list();
					multipleUsers.addAll(user);
					}
				}
				}
			}
		return multipleUsers;
		}

	@Override
	public int deleteUser(int id,User user) throws Exception {
			
			int result = 0;
			Transaction tx = null;
			SessionFactory sessionFactory = WalkerUtil.getSession();
			Session session = sessionFactory.openSession();
			tx = session.beginTransaction();	
			if(session.isOpen() && session.isConnected()){
				
				Criteria criteria = session.createCriteria(User.class);
				criteria.add(Restrictions.eq("id", id));
				user = (User) criteria.uniqueResult();
				session.delete(user);
				
				if(tx!=null){
					tx.commit();
				}
			}
			else{
					throw new Exception("Session cannot be established, please try again later. Thanks for your patience");
				}
		return result;
	}
	
	private List<User> returnAllUsers(){
		List<User> userList = new ArrayList<User>();
		
		//SessionFactory sessionFactory  = WalkerUtil.getSession();
		session = sessionFactory.openSession();
		Query query = session.createQuery("from User");
		query.setFirstResult(1);
		query.setMaxResults(7);
		userList = query.list();

		return userList;
	}

	@Override
	public String saveBMIiDAO(health h) {
		//SessionFactory sessionFactory = WalkerUtil.getSession();
		session = sessionFactory.openSession();
		Transaction transaction = null;
		
		transaction = session.beginTransaction();
		if(transaction.isActive()){
			session.saveOrUpdate(h);
		}
		
		if(transaction!=null){
			transaction.commit();
		}
		if(session!=null){
			session.close();
		}
			
		
		
		return "user health information is saved";
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List retrieveUserHealthHistory(int id) {
		//List of all the user data
		SessionFactory sessionFactory = WalkerUtil.getSession();
		Session session  = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(health.class);
		List response = criteria.add(Restrictions.eq("userId", id)).list();
			if(response.isEmpty()){
				return response;
			}
			if(session!=null){
				session.close();
		}
		
			return response;
	}

	@Override
	public String saveCoachData(String name, String description) {
		//this information needs to go into the coach database
		//session = getSessionFactory().openSession();
		
		//if(session.isOpen()){
				
//		}
		
		session = getSessionFactory().getCurrentSession();
		
		Coach coach = new Coach();
		
		coach.setName(name);
		coach.setDescription(description);
		try{
			session.persist(coach);
			
//			Transaction transaction = null;
//			transaction = session.beginTransaction();
//			transaction.commit();
			
			//session.flush();
			//Closing the session so that resource is returned to pool
			try{
				
			if(session!=null){
				session.close();
				}
			}
			catch(HibernateException e){
					//transaction.rollback();
					e.printStackTrace();
					throw new RuntimeException("failed to close session, Check your configurations");
				}
			
		}
			catch(HibernateException exception){
				System.out.println("failed to save entity");
				exception.printStackTrace();
		}
		
		String message = "Successfully saved information";
		return message;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Coach> getListofCoach() {
		List<Coach> coachList = new ArrayList<Coach>();
		session = sessionFactory.openSession();
		Query query = session.createQuery("from Coach ");
		coachList = query.list();
		
		return coachList;
	}

	
}	

