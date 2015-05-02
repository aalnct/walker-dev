package com.application.walker.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

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

	public WalkerDAO() {

	}

	@Override
	@Transactional
	public void addUser(User user) {

		Address address = user.getAddress();
		
//		if(sessionFactory == null){
//			sessionFactory = WalkerUtil.getSession();
//		}
		
		
		session = sessionFactory.openSession();

		Query query = session.createQuery("from User where username = ?");
		System.out.println("Query :" + query);
		User user_exists = (User) query.setString(0, user.getUsername())
				.uniqueResult();

		if (user_exists == null) {
			if (session.isConnected()) {
				session.save(address);
				user.setAddress(address);
				session.save(user);
				System.out.println("**********");
			}
		} else {
			System.out.println("User already exists, cannot commit");
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public Set<User> retrieveUser(List<String> username,
			List<String> lastname, List<String> emailid, String dob, Integer zip) {
		List<User> user = null;
		Set<User> multipleUsers = new HashSet<User>();
		// SessionFactory sessionFactory = WalkerUtil.getSession();
		session = sessionFactory.openSession();

		if (session.isOpen()) {
			if (session.isConnected()) {
				if (username == null && lastname == null && emailid == null) {
					Set<User> userlist = returnAllUsers();
					return userlist;
				}

				if (!(username.isEmpty())) {
					for (String user_name : username) {
						String userN = user_name.replaceAll(",", "");
						if (!(userN.equals("") || userN.equalsIgnoreCase(null))) {
							Criteria criteria = session
									.createCriteria(User.class);
							criteria.add(Restrictions.eq("username", user_name))
									.setTimeout(5000);
							criteria.setLockMode(LockMode.READ);
							user = criteria.list();
							multipleUsers.addAll(user);
						}
					}
				}

				if (!(lastname.isEmpty())) {
					for (String last_name : lastname) {
						String last = last_name.replaceAll(",", "");
						if (!(last.equals("") || last.equalsIgnoreCase(null))) {
							Criteria criteria = session
									.createCriteria(User.class);
							criteria.add(Restrictions.eq("lastName", last_name))
									.setTimeout(5000);
							criteria.setLockMode(LockMode.READ);
							user = criteria.list();
							multipleUsers.addAll(user);
						}
					}
				}

				if (!(emailid.isEmpty())) {
					for (String email_id : emailid) {
						String email = email_id.replaceAll(",", "");
						if (!(email.equals("") || email.equals(null))) {
							Criteria criteria = session
									.createCriteria(User.class);
							criteria.add(
									Restrictions.eq("emailAddress", email_id))
									.setTimeout(5000)
									.setLockMode(LockMode.READ);
							user = criteria.list();
							multipleUsers.addAll(user);
						}
					}
				}
				if (dob != null) {
					if (!(dob.equals(null) || dob.equals(""))) {
						Criteria criteria = session.createCriteria(User.class);
						criteria.add(Restrictions.eq("dob", dob)).setTimeout(
								5000);
						criteria.setLockMode(LockMode.READ);
						user = criteria.list();
						multipleUsers.addAll(user); 
					}
				}
				if (zip != null) {
					if (!(zip.equals(null) || zip.equals(""))) {
						Criteria criteria = session.createCriteria(User.class,
								"user");
						criteria.createAlias("user.address", "address");
						criteria.add(Restrictions.eq("address.zipcode", zip))
								.setTimeout(5000);
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
	public int deleteUser(int id, User user) throws Exception {

		int result = 0;
		Transaction tx = null;
		SessionFactory sessionFactory = WalkerUtil.getSession();
		Session session = sessionFactory.openSession();
		tx = session.beginTransaction();
		if (session.isOpen() && session.isConnected()) {

			Criteria criteria = session.createCriteria(User.class);
			criteria.add(Restrictions.eq("id", id));
			user = (User) criteria.uniqueResult();
			session.delete(user);

			if (tx != null) {
				tx.commit();
			}
		} else {
			throw new Exception(
					"Session cannot be established, please try again later. Thanks for your patience");
		}
		return result;
	}

	private Set<User> returnAllUsers() {
		Set<User> userList = new HashSet<User>();

		// SessionFactory sessionFactory = WalkerUtil.getSession();
		session = sessionFactory.openSession();
		Query query = session.createQuery("from User");
		// query.setFirstResult(1);
		// query.setMaxResults(7);
		userList.addAll(query.list());

		return userList;
	}

	@Override
	public String saveBMIiDAO(health h) {
		// SessionFactory sessionFactory = WalkerUtil.getSession();
		session = sessionFactory.openSession();
		Transaction transaction = null;

		transaction = session.beginTransaction();
		if (transaction.isActive()) {
			session.saveOrUpdate(h);
		}

		if (transaction != null) {
			transaction.commit();
		}
		if (session != null) {
			session.close();
		}

		return "user health information is saved";
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List retrieveUserHealthHistory(int id) {
		// List of all the user data
		SessionFactory sessionFactory = WalkerUtil.getSession();
		Session session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(health.class);
		List response = criteria.add(Restrictions.eq("userId", id)).list();
		if (response.isEmpty()) {
			return response;
		}
		if (session != null) {
			session.close();
		}

		return response;
	}

	@Override
	public String saveCoachData(String name, String coachEmailId,
			String description) {
		session = getSessionFactory().openSession();

		Coach coach = new Coach();

		coach.setName(name);
		coach.setCoachEmailId(coachEmailId);
		coach.setDescription(description);

		try {

			List<Query> queryForCoach = session
					.createQuery(
							"from Coach c where c.coachEmailId = :coachEmailId")
					.setParameter("coachEmailId", coachEmailId).list();

			if (queryForCoach.size() < 1) {
				session.persist(coach);
			} else {
				return "No Information is saved as coach already exists :)";
			}

			Transaction transaction = null;
			transaction = session.beginTransaction();
			transaction.commit();

			try {

				if (session != null) {
					session.close();
				}
			} catch (HibernateException e) {
				e.printStackTrace();
				throw new RuntimeException(
						"failed to close session, Check your configurations");
			}

		} catch (HibernateException exception) {
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

		if (session != null) {
			session.close();
		}

		return coachList;

	}

	@Override
	public String assignCoachtoUser(String coachName, String coachEmailid,
			String userName, String userEmailId) {

		Coach coach = new Coach();
		User user;
		String message = null;

		session = getSessionFactory().openSession();

		Criteria criteria = session.createCriteria(Coach.class).add(
				Restrictions.eq("coachEmailId", coachEmailid));
		
		coach = (Coach)criteria.uniqueResult();
		if ( coach == null) {
			
			
			return "no coach with the given information exists, please check with the coach admin";
			
		} else {
			// save the information and assign the coach ID against user ID
			criteria = session.createCriteria(User.class).add(
					Restrictions.eq("emailAddress", userEmailId));

			if (criteria != null) {

				user = (User) criteria.uniqueResult();
				System.out.println("Getting user ID :" + user.getId());
				
				coach.setUserId(user.getId());
				
				coach.setMessage("Information Saved!!");

				session.save(coach);
				
				Transaction transaction = null;
				transaction = session.beginTransaction();
				
				transaction.commit();
				
			}

		}
		
		if(session!=null){
			
			session.close();
			
		}
		

		return coach.getMessage();
	}

	@Override
	public User retrieveUserInformationForUpdate(Integer id) {
		
		session = sessionFactory.openSession();
		Criteria criteria = session.createCriteria(User.class).add(Restrictions.idEq(id));
		
		User user = (User)criteria.uniqueResult();
		
		try{
			
			if(session != null){
				//removing information from saved session cache -- other way can be using evict (session.evict())
				session.clear();
				session.close();
			
			}
			
		}catch(HibernateException exception){
			exception.getMessage();
			exception.printStackTrace();
		}
		
		return user;
	}

}
