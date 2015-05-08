package com.application.walker.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.application.walker.dao.IWalkerDAO;
import com.application.walker.dao.LoginDaoImpl;
import com.application.walker.dao.WalkerDAO;
import com.application.walker.dao.iLoginDao;

@Service
@Transactional(propagation =Propagation.REQUIRES_NEW)
public class WalkerService {
	
	@Autowired
	private IWalkerDAO iWalkerDAO;
	
	@Autowired
	@Qualifier("loginDaoImpl")
	private iLoginDao iLoginDao;
	
	public iLoginDao getiLoginDao() {
		return iLoginDao;
	}
	public void setiLoginDao(iLoginDao iLoginDao) {
		this.iLoginDao = iLoginDao;
	}
	public IWalkerDAO getiWalkerDAO() {
		return iWalkerDAO;
	}
	
	public void addEmployee(User user) throws Exception {
		if(iWalkerDAO == null){
			iWalkerDAO = new WalkerDAO();
			if(iLoginDao == null){
				iLoginDao = new LoginDaoImpl();
			}
		}
		//just to test exception in Junit.
		if(!user.getAddress().getCity().equals("NewYork")){
				throw new Exception("City is not valid");
		}
		
		getiWalkerDAO().addUser(user);
	}
	
	public User loginUser(String username, String lastname){
		User user = getiLoginDao().loginUser(username,lastname);
		return user;
	}
	
	public Set<User> retireveUserbyUserName(List<String> username, List<String> lastname, List<String> emailid,String dob,Integer zip){
		Set<User> user = iWalkerDAO.retrieveUser(username,lastname,emailid,dob,zip);
		return user;
	}
	//@Transactional
	public void deletingUserInformation(int id,User user) throws Exception {
		iWalkerDAO.deleteUser(id,user);
		
	}
	//@Transactional
	public String saveBMIService(health health){
		String message = getiWalkerDAO().saveBMIiDAO(health);
		return message;
	}
	
	public List retrieveUserHistory(int id){
		List response = getiWalkerDAO().retrieveUserHealthHistory(id);
		return response;
	}
	
	
	public String saveCoachInformation(String name, String coachEmailId,String description){
		String message = getiWalkerDAO().saveCoachData(name,coachEmailId, description);
		return message;
	}
	
	public List<String> getAllCoach(){
		List<String> coachStringList = new ArrayList<String>();

		List<Coach> coachList =  getiWalkerDAO().getListofCoach();
		
		for(Coach coach1 : coachList){
			
			if(coachList.isEmpty()){ 
			Coach coach = new Coach();
			coach.setMessage("No data  found");
			//return coach;
		
		}

			coachStringList.add(coach1.getName());
			coachStringList.add(coach1.getDescription());
			coachStringList.add(Integer.toString(coach1.getId()));
		}
		
		return coachStringList;
	}
	public void setiWalkerDAO(IWalkerDAO iWalkerDAO) {
		this.iWalkerDAO = iWalkerDAO;
	}
	@Transactional
	public String assignCoachtoUser(String coachName, String coachEmailId, String userName, String userEmailId){
		
		String assigned = null;
		
		assigned = getiWalkerDAO().assignCoachtoUser(coachName, coachEmailId, userName, userEmailId);
		
		return assigned;
	}
	
	public User retrieveUserInformationForUpdate(Integer id){
		
		User user  = new User();
		
		if(!id.equals(null) || !id.equals(""))
			 
		user.setId(id);
		User userTO = getiWalkerDAO().retrieveUserInformationForUpdate(id);
		
		return userTO;
	}
	
}
