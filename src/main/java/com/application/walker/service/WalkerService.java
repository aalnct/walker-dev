package com.application.walker.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.application.walker.dao.IWalkerDAO;
import com.application.walker.dao.iLoginDao;

@Service
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
	public void setiWalkerDAO(IWalkerDAO iWalkerDAO) {
		this.iWalkerDAO = iWalkerDAO;
	}
	
	//will pass this to controller
	public void addEmployee(User user){
		getiWalkerDAO().addUser(user);
	}
	
	public User loginUser(String username, String lastname){
		User user = getiLoginDao().loginUser(username,lastname);
		return user;
	}
	
	@SuppressWarnings("rawtypes")
//	public User retireveUserbyUserName(String userName){
		public User retireveUserbyUserName(String username, String lastname, String emailid){
		User user = iWalkerDAO.retrieveUser(username,lastname,emailid);
		return user;
	}
	public int deletingUserInformation(String username) throws Exception {
		int result = iWalkerDAO.deleteUser(username);
		return result;
		
	}
	
}
