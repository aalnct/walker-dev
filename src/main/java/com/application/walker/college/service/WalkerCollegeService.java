/**
 * 
 */
package com.application.walker.college.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.walker.dao.IWalkerCollegeDAO;

/**
 * @author AmitAgarwal
 *
 */
@Service
public class WalkerCollegeService {
		
	@Autowired
	private IWalkerCollegeDAO walkerCollegeDAO;

	public IWalkerCollegeDAO getWalkerCollegeDAO() {
		return walkerCollegeDAO;
	}

	public void setWalkerCollegeDAO(IWalkerCollegeDAO walkerCollegeDAO) {
		this.walkerCollegeDAO = walkerCollegeDAO;
	}
	
	public void searchFacultyDetails(String emailAddress){
		if(!emailAddress.equals(null)){
			getWalkerCollegeDAO().searchFacultyDetails(emailAddress);
		}
		
	}
	
	public void saveFacultData(Faculty faculty){
		
		if(!faculty.equals(null)){
			walkerCollegeDAO.saveFacultyData(faculty);
		}
		
		else{
			faculty.setMessage("Data needs to be populated to be saved");
		}
		 
	}
}
